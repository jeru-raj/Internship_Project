""" Copyright (c) 2026 ARCASCEND DIGITECH PRIVATE LIMITED. All rights reserved.
This file is part of the Donor Report Automation System (DRAS) project.
Author: Jerusha Caroline Raj A Created: 2026-06-30
Description: Handles request processing, dashboard rendering, donor and
field worker management, sponsor report uploads, and the AJAX endpoint
used to look up a field worker's assigned donor. """

import os
from django.shortcuts import render, redirect
from django.conf import settings
from django.core.files.storage import FileSystemStorage
from django.utils import timezone
from django.http import JsonResponse
from .emailsender import send_email

from datetime import datetime

from .models import (
    Donors,
    FieldWorkers,
    SponsorReportHistory
)


# ---------------- HOME ----------------
def home(request):
    """Renders the dashboard home page.

    Computes summary counts for donors, field workers, and sponsor
    reports and passes them to the home page template.

    Args:
        request (HttpRequest):
            Incoming HTTP request.

    Returns:
        HttpResponse:
            Rendered ``index.html`` page containing the dashboard
            summary counts.
    """

    context = {
        "total_donors": Donors.objects.count(),
        "total_fieldworkers": FieldWorkers.objects.count(),
        "total_reports": SponsorReportHistory.objects.count()
    }

    return render(request, "index.html", context)


# ---------------- DONOR ----------------
def donor(request):
    """Lists existing donors and handles creation of a new donor.

    On a GET request, displays all donors ordered by name. On a POST
    request with a donor name and email address supplied, creates a
    new active :class:`Donors` record and redirects back to this view
    to show the updated list.

    Args:
        request (HttpRequest):
            Incoming HTTP request. For POST requests, expects
            ``donor_name`` and ``email_address`` form fields.

    Returns:
        HttpResponse:
            Either a redirect to the donor list (after a successful
            creation) or the rendered ``donor.html`` page listing all
            donors.
    """

    if request.method == "POST":

        donor_name = request.POST.get("donor_name")
        email_address = request.POST.get("email_address")

        if donor_name and email_address:

            Donors.objects.create(
                donor_name=donor_name,
                email_address=email_address,
                active_flag='Y'
            )

            return redirect("/donor")

    donors = Donors.objects.all().order_by("donor_name")

    return render(request, "donor.html", {"donors": donors})



# ---------------- FIELD WORKER ----------------
def fieldworker(request):
    """Lists existing field workers and handles creation of a new one.

    On a GET request, displays all field workers ordered by name along
    with the list of donors available for assignment. On a POST request
    with a field worker name and donor id supplied, creates a new active
    :class:`FieldWorkers` record linked to the chosen donor and redirects
    back to this view.

    Args:
        request (HttpRequest):
            Incoming HTTP request. For POST requests, expects
            ``fieldworker_name`` and ``donor_id`` form fields.

    Returns:
        HttpResponse:
            Either a redirect to the field worker list (after a
            successful creation) or the rendered ``fieldworker.html``
            page listing field workers and donors.
    """

    if request.method == "POST":

        fieldworker_name = request.POST.get("fieldworker_name")
        donor_id = request.POST.get("donor_id")

        if fieldworker_name and donor_id:

            donor = Donors.objects.get(donor_id=donor_id)

            FieldWorkers.objects.create(
                fieldworker_name=fieldworker_name,
                donor=donor,
                active_flag='Y'
            )

            return redirect("/fieldworker")

    fieldworkers = FieldWorkers.objects.all().order_by("fieldworker_name")

    return render(
        request,
        "fieldworker.html",
        {
            "fieldworkers": fieldworkers,
            "donors": Donors.objects.all().order_by("donor_name")
        }
    )
def upload(request):
    """Handles sponsor report uploads.

    On a GET request, displays the upload form along with the list of
    field workers. On a POST request, validates the submitted report
    and receipt files (presence, allowed extension, report date,
    matching field worker, an assigned donor, and absence of a
    duplicate report for the same field worker/month/year), then saves
    both files to a year/month/field-worker folder under
    ``sponsor_reports/`` and creates a corresponding
    :class:`SponsorReportHistory` record with an initial pending email
    status. The actual email send-out is performed separately by the
    ``send_reports`` management command.

    Args:
        request (HttpRequest):
            Incoming HTTP request. For POST requests, expects
            ``report_file``, ``receipt_file``, ``report_date``, and
            ``fieldworker_name`` fields.

    Returns:
        HttpResponse:
            Rendered ``upload.html`` page, including a status/error
            ``message`` and the current list of field workers.
    """

    message = None

    if request.method == "POST":

        report_file = request.FILES.get("report_file")
        receipt_file = request.FILES.get("receipt_file")

        report_date = request.POST.get("report_date")
        fieldworker_name = request.POST.get("fieldworker_name")

        if not report_file or not receipt_file:
            return render(request, "upload.html", {
                "message": "Please upload both Report and Receipt.",
                "fieldworkers": FieldWorkers.objects.all().order_by("fieldworker_name")
            })
        # ---------- VALIDATE FILE TYPES ----------

        allowed_extensions = [".pdf", ".jpg", ".jpeg", ".png"]

        report_ext = os.path.splitext(report_file.name)[1].lower()
        receipt_ext = os.path.splitext(receipt_file.name)[1].lower()

        if report_ext not in allowed_extensions:
            return render(request, "upload.html", {
        "message": "Report file must be PDF, JPG, JPEG, or PNG.",
        "fieldworkers": FieldWorkers.objects.all().order_by("fieldworker_name")
    })

        if receipt_ext not in allowed_extensions:
            return render(request, "upload.html", {
        "message": "Receipt file must be PDF, JPG, JPEG, or PNG.",
        "fieldworkers": FieldWorkers.objects.all().order_by("fieldworker_name")
    })

        if not report_date:
            return render(request, "upload.html", {
                "message": "Please select Report Date.",
                "fieldworkers": FieldWorkers.objects.all().order_by("fieldworker_name")
            })

        try:
            selected_date = datetime.strptime(report_date, "%Y-%m-%d")
        except ValueError:
            return render(request, "upload.html", {
                "message": "Invalid Date.",
                "fieldworkers": FieldWorkers.objects.all().order_by("fieldworker_name")
            })

        month = selected_date.month
        year = selected_date.year

        fieldworker = FieldWorkers.objects.filter(
            fieldworker_name__iexact=fieldworker_name
        ).first()

        if not fieldworker:
            return render(request, "upload.html", {
                "message": "Field Worker not found.",
                "fieldworkers": FieldWorkers.objects.all().order_by("fieldworker_name")
            })

        donor = fieldworker.donor

        if not donor:
            return render(request, "upload.html", {
                "message": "No donor assigned to this Field Worker.",
                "fieldworkers": FieldWorkers.objects.all().order_by("fieldworker_name")
            })

        duplicate = SponsorReportHistory.objects.filter(
            fieldworker=fieldworker,
            report_month=month,
            report_year=year
        ).exists()

        if duplicate:
            return render(request, "upload.html", {
                "message": "Report already uploaded for this Field Worker for the selected month.",
                "fieldworkers": FieldWorkers.objects.all().order_by("fieldworker_name")
            })

        # ---------------- SAVE FILES ----------------

        
        base_path = os.path.join(settings.BASE_DIR, "sponsor_reports")

        upload_folder = os.path.join(
            base_path,
            str(year),
            f"{month:02d}",
            fieldworker.fieldworker_name
        )

        os.makedirs(upload_folder, exist_ok=True)

        report_filename = "report" + report_ext
        receipt_filename = "receipt" + receipt_ext

        fs = FileSystemStorage(location=upload_folder)

        fs.save(report_filename, report_file)
        fs.save(receipt_filename, receipt_file)

        report_path = os.path.join(upload_folder, report_filename)
        receipt_path = os.path.join(upload_folder, receipt_filename)

        # ---------------- SAVE DB ----------------

        report = SponsorReportHistory.objects.create(
            donor=donor,
            fieldworker=fieldworker,
            report_file_name=report_filename,
            receipt_file_name=receipt_filename,
            report_month=month,
            report_year=year,
            email_sent="N",
            email_status="Uploaded",
            sent_date=None
        )

        # ---------------- SEND EMAIL ----------------

        subject = (
    f"Monthly Mission Report - "
    f"{report.fieldworker.fieldworker_name} - "
    f"{report.report_month:02d}/{report.report_year}"
)
        body = f"""
Dear {donor.donor_name},

Greetings in the precious name of our Lord Jesus Christ.

Thank you for your faithful prayers and generous support towards the ministry. We are grateful to God for your partnership in advancing His Kingdom.

Please find attached the ministry report from Missionary {fieldworker.fieldworker_name} for {month:02d}/{year}. We pray that this report will encourage you as you see how God is working through the ministry.

Your continued prayers and support are greatly appreciated and play an important role in reaching lives with the Gospel.

May the Lord richly bless you and your family.

With gratitude,
Mission Support Team

"Not that I seek the gift, but I seek the fruit that abounds to your account." – Philippians 4:17
"""

        report.email_sent = "N"
        report.email_status = "Pending"
        report.save()
        message = "Upload completed"

    return render(request, "upload.html", {
        "message": message,
        "fieldworkers": FieldWorkers.objects.all().order_by("fieldworker_name")
    })
    
# ---------------- HISTORY ----------------
def history(request):
    """Displays the full sponsor report upload/email history.

    Args:
        request (HttpRequest):
            Incoming HTTP request.

    Returns:
        HttpResponse:
            Rendered ``history.html`` page listing all
            :class:`SponsorReportHistory` records, most recently
            created first.
    """

    reports = SponsorReportHistory.objects.all().order_by("-created_date")

    return render(
        request,
        "history.html",
        {
            "reports": reports
        }
    )
# ---------------- GET DONOR ----------------
def get_donor(request):
    """Returns the donor name assigned to a given field worker as JSON.

    Used by the front-end (via AJAX) to auto-populate the donor field
    on the upload form once a field worker is selected.

    Args:
        request (HttpRequest):
            Incoming HTTP GET request. Expects a ``fieldworker`` query
            parameter containing the field worker's name.

    Returns:
        JsonResponse:
            A JSON object with a single ``donor`` key containing the
            matched donor's name, or an empty string if no matching
            field worker (or assigned donor) is found.
    """

    fieldworker_name = request.GET.get("fieldworker")

    worker = FieldWorkers.objects.filter(
        fieldworker_name__iexact=fieldworker_name
    ).select_related("donor").first()

    if worker and worker.donor:

        return JsonResponse({
            "donor": worker.donor.donor_name
        })

    return JsonResponse({
        "donor": ""
    })