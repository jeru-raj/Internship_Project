""" Copyright (c) 2026 ARCASCEND DIGITECH PRIVATE LIMITED. All rights reserved.
This file is part of the Donor Report Automation System (DRAS) project.
Author: Jerusha Caroline Raj A Created: 2026-06-30
Description: Implements the custom "send_reports" Django management
command, which scans for sponsor reports pending email delivery,
attaches the report and receipt files, sends them to the assigned
donor, and updates each report's email status accordingly. """

from pathlib import Path

from django.conf import settings
from django.core.management.base import BaseCommand
from django.utils import timezone

from dras_app.models import SponsorReportHistory
from dras_app.emailsender import send_email


class Command(BaseCommand):
    """Management command that emails pending sponsor reports to donors.

    Run via ``python manage.py send_reports``. Iterates over all
    :class:`SponsorReportHistory` records whose ``email_sent`` flag is
    ``"N"``, locates the corresponding report and receipt files on
    disk under ``sponsor_reports/<year>/<month>/<fieldworker>/``,
    sends them as email attachments to the assigned donor, and updates
    each record's ``email_sent``, ``email_status``, ``sent_date``, and
    ``error_message`` fields based on the outcome.

    Attributes:
        help (str):
            Short description shown by ``manage.py help send_reports``.
    """

    help = "Send pending sponsor reports to donors"

    def handle(self, *args, **kwargs):
        """Executes the send_reports command.

        Finds all pending (``email_sent == "N"``) sponsor report
        records, skips any that are missing a donor, field worker, or
        report/receipt file on disk, sends an email with the available
        attachments to the donor, and persists the resulting status
        (``SUCCESS`` or ``FAILED``) back onto each report record.
        Progress and outcomes are printed to the console for visibility
        when run manually or via a scheduled task.

        Args:
            *args:
                Positional arguments passed by Django's management
                command framework (unused).
            **kwargs:
                Keyword arguments passed by Django's management
                command framework (unused).

        Returns:
            None
        """

        pending_reports = SponsorReportHistory.objects.filter(email_sent="N")

        print("=" * 60)
        print(f"Pending reports: {pending_reports.count()}")
        print("=" * 60)

        base_path = Path(settings.BASE_DIR) / "sponsor_reports"

        for report in pending_reports:

            try:

                if report.donor is None:
                    print(f"Skipping Report {report.report_id} - Donor missing")
                    continue

                if report.fieldworker is None:
                    print(f"Skipping Report {report.report_id} - Field Worker missing")
                    continue

                folder = (
                    base_path
                    / str(report.report_year)
                    / f"{report.report_month:02d}"
                    / report.fieldworker.fieldworker_name
                )

                report_path = folder / report.report_file_name

                attachments = []

                if report_path.exists():
                    attachments.append(str(report_path))
                else:
                    print(f"Report file not found: {report_path}")

                if report.receipt_file_name:
                    receipt_path = folder / report.receipt_file_name

                if receipt_path.exists():
                    attachments.append(str(receipt_path))
                else:
                    print(f"Receipt file not found: {receipt_path}")

                if not attachments:
                    print(f"Skipping Report ID {report.report_id} because no files exist.")
                    print("-" * 60)
                    continue
                subject = (
                    f"Monthly Mission Report – "
                    f"{report.report_month:02d}/{report.report_year}"
                )

                body = f"""
Dear {report.donor.donor_name},

Greetings in the precious name of our Lord Jesus Christ.

Thank you for your faithful prayers and generous support towards the ministry. We are grateful to God for your partnership in advancing His Kingdom.

Please find attached the ministry report from Missionary {report.fieldworker.fieldworker_name} for {report.report_month:02d}/{report.report_year}. We pray that this report will encourage you as you see how God is working through the ministry.

Your continued prayers and support are greatly appreciated and play an important role in reaching lives with the Gospel.

May the Lord richly bless you and your family.

With gratitude,
Mission Support Team

"Not that I seek the gift, but I seek the fruit that abounds to your account." – Philippians 4:17
"""

                print("-" * 60)
                print(f"Sending Report ID : {report.report_id}")
                print(f"To               : {report.donor.email_address}")
                print(f"Attachments      : {attachments}")

                success, error = send_email(
                    to_email=report.donor.email_address,
                    subject=subject,
                    body=body,
                    attachments=attachments
                )

                if success:
                    report.email_sent = "Y"
                    report.email_status = "SUCCESS"
                    report.sent_date = timezone.now()
                    report.error_message = None
                    report.save()

                    print("Email sent successfully.")

                else:
                    report.email_sent = "N"
                    report.email_status = "FAILED"
                    report.error_message = error
                    report.save()

                    print(f"Email failed: {error}")

            except Exception as e:

                report.email_sent = "N"
                report.email_status = "FAILED"
                report.error_message = str(e)
                report.save()

                print(f"Error processing Report {report.report_id}: {e}")

        print("=" * 60)
        print("Finished checking pending reports.")
        print("=" * 60)