""" Copyright (c) 2026 ARCASCEND DIGITECH PRIVATE LIMITED. All rights reserved.
This file is part of the Donor Report Automation System (DRAS) project.
Author: Jerusha Caroline Raj A Created: 2026-06-30
Description: Defines Django database models used throughout the DRAS
application, including Donors, FieldWorkers, SponsorReportHistory, and
EmailLog. All models map to an existing, externally managed MySQL schema
(managed = False) rather than tables created by Django migrations. """

from django.db import models


class Donors(models.Model):
    """Represents a sponsor/donor who financially supports field workers.

    Maps to the externally managed ``Donors`` database table. Each donor
    can be linked to one or more field workers and receives sponsor
    report emails for the field workers they support.

    Attributes:
        donor_id (AutoField):
            Primary key uniquely identifying the donor.
        donor_name (CharField):
            Full name of the donor.
        email_address (CharField):
            Email address used to send sponsor reports to the donor.
        active_flag (CharField):
            Single-character flag ('Y'/'N') indicating whether the
            donor record is currently active.
        created_date (DateTimeField):
            Timestamp automatically set when the donor record is created.
        modified_date (DateTimeField):
            Timestamp automatically updated whenever the donor record
            is saved.
    """

    donor_id = models.AutoField(primary_key=True)

    donor_name = models.CharField(max_length=255)

    email_address = models.CharField(max_length=255)

    active_flag = models.CharField(max_length=1, default='Y')

    created_date = models.DateTimeField(auto_now_add=True)

    modified_date = models.DateTimeField(auto_now=True)

    class Meta:
        """Model metadata for the Donors model.

        Configures the model as unmanaged (the table already exists in
        the database and is not created/altered by Django migrations)
        and binds it to the ``Donors`` table.
        """

        managed = False
        db_table = "Donors"


class FieldWorkers(models.Model):
    """Represents a field worker (missionary) supported by a donor.

    Maps to the externally managed ``FieldWorkers`` database table.
    Each field worker is optionally linked to the donor who sponsors
    them, and is the subject of the monthly sponsor reports uploaded
    through the application.

    Attributes:
        fieldworker_id (AutoField):
            Primary key uniquely identifying the field worker.
        fieldworker_name (CharField):
            Full name of the field worker.
        donor (ForeignKey):
            Reference to the :class:`Donors` record sponsoring this
            field worker. May be null if no donor is currently assigned.
        active_flag (CharField):
            Single-character flag ('Y'/'N') indicating whether the
            field worker record is currently active.
    """

    fieldworker_id = models.AutoField(primary_key=True)

    fieldworker_name = models.CharField(max_length=255)
    donor = models.ForeignKey(
    Donors,
    on_delete=models.DO_NOTHING,
    db_column="donor_id",
    null=True,
    blank=True
)

    active_flag = models.CharField(max_length=1, default='Y')

    class Meta:
        """Model metadata for the FieldWorkers model.

        Configures the model as unmanaged (the table already exists in
        the database and is not created/altered by Django migrations)
        and binds it to the ``FieldWorkers`` table.
        """

        managed = False
        db_table = "FieldWorkers"


class SponsorReportHistory(models.Model):
    """Records each monthly sponsor report uploaded for a field worker.

    Maps to the externally managed ``Sponsor_Report_History`` database
    table. A row is created whenever a report and receipt are uploaded
    via the upload view, and is later updated by the ``send_reports``
    management command once the associated email has been sent (or has
    failed to send) to the donor.

    Attributes:
        report_id (AutoField):
            Primary key uniquely identifying the report record.
        donor (ForeignKey):
            Reference to the :class:`Donors` record who should receive
            this report by email.
        fieldworker (ForeignKey):
            Reference to the :class:`FieldWorkers` record the report
            was submitted for.
        report_file_name (CharField):
            Stored filename of the uploaded report document.
        receipt_file_name (CharField):
            Stored filename of the uploaded receipt document.
        report_month (IntegerField):
            Calendar month (1-12) the report covers.
        report_year (IntegerField):
            Calendar year the report covers.
        email_sent (CharField):
            Single-character flag ('Y'/'N') indicating whether the
            report email has been successfully sent to the donor.
        sent_date (DateTimeField):
            Timestamp recording when the report email was sent.
        email_subject (CharField):
            Subject line used for the report email.
        email_status (CharField):
            Human-readable status of the email delivery attempt (for
            example "Uploaded", "Pending", "SUCCESS", or "FAILED").
        error_message (TextField):
            Error details captured if the email failed to send.
        created_date (DateTimeField):
            Timestamp recording when the report record was created.
    """

    report_id = models.AutoField(primary_key=True)

    donor = models.ForeignKey(
        Donors,
        on_delete=models.DO_NOTHING,
        db_column="donor_id",
        null=True,
        blank=True
    )

    fieldworker = models.ForeignKey(
        FieldWorkers,
        on_delete=models.DO_NOTHING,
        db_column="fieldworker_id",
        null=True,
        blank=True
    )

    report_file_name = models.CharField(max_length=500)
    receipt_file_name = models.CharField(
    max_length=500,
    null=True,
    blank=True
)

    report_month = models.IntegerField(null=True, blank=True)

    report_year = models.IntegerField(null=True, blank=True)

    email_sent = models.CharField(max_length=1, null=True, blank=True)

    sent_date = models.DateTimeField(null=True, blank=True)

    email_subject = models.CharField(max_length=500, null=True, blank=True)

    email_status = models.CharField(max_length=50, null=True, blank=True)

    error_message = models.TextField(null=True, blank=True)

    created_date = models.DateTimeField(null=True, blank=True)

    class Meta:
        """Model metadata for the SponsorReportHistory model.

        Configures the model as unmanaged (the table already exists in
        the database and is not created/altered by Django migrations)
        and binds it to the ``Sponsor_Report_History`` table.
        """

        managed = False
        db_table = "Sponsor_Report_History"


class EmailLog(models.Model):
    """Records the outcome of an individual email delivery attempt.

    Maps to the externally managed ``Email_Log`` database table. This
    model provides a granular audit trail that is separate from the
    summary fields stored directly on :class:`SponsorReportHistory`.

    Attributes:
        log_id (AutoField):
            Primary key uniquely identifying the log entry.
        report (ForeignKey):
            Reference to the :class:`SponsorReportHistory` record this
            log entry relates to.
        email_to (CharField):
            Email address the message was sent to.
        sent_timestamp (DateTimeField):
            Timestamp recording when the email was sent.
        status (CharField):
            Outcome of the send attempt (for example "SUCCESS" or
            "FAILED").
        remarks (TextField):
            Additional notes or error details about the send attempt.
    """

    log_id = models.AutoField(primary_key=True)

    report = models.ForeignKey(
        SponsorReportHistory,
        on_delete=models.DO_NOTHING,
        db_column="report_id",
        null=True,
        blank=True
    )

    email_to = models.CharField(max_length=255)

    sent_timestamp = models.DateTimeField(null=True, blank=True)

    status = models.CharField(max_length=50, null=True, blank=True)

    remarks = models.TextField(null=True, blank=True)

    class Meta:
        """Model metadata for the EmailLog model.

        Configures the model as unmanaged (the table already exists in
        the database and is not created/altered by Django migrations)
        and binds it to the ``Email_Log`` table.
        """

        managed = False
        db_table = "Email_Log"