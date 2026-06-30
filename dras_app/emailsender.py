""" Copyright (c) 2026 ARCASCEND DIGITECH PRIVATE LIMITED. All rights reserved.
This file is part of the Donor Report Automation System (DRAS) project.
Author: Jerusha Caroline Raj A Created: 2026-06-30
Description: Provides the low-level email-sending utility used by both
the upload workflow and the send_reports management command. Loads
Gmail SMTP credentials from the project's .env file and sends report
emails with optional file attachments via Gmail's SMTP service. """

import smtplib
import os
from email.message import EmailMessage
from dotenv import load_dotenv

from pathlib import Path
import os
from dotenv import load_dotenv

BASE_DIR = Path(__file__).resolve().parent.parent
load_dotenv(BASE_DIR / ".env")

SENDER_EMAIL = os.getenv("GMAIL_USER")
APP_PASSWORD = os.getenv("GMAIL_APP_PASSWORD")


def send_email(to_email, subject, body, attachments=None):
    """Sends an email via Gmail SMTP, optionally with file attachments.

    Builds a plain-text email message addressed from the configured
    ``GMAIL_USER`` sender to ``to_email``, attaches any files found at
    the given ``attachments`` paths, and sends it using Gmail's SMTP
    server over STARTTLS on port 587.

    Args:
        to_email (str):
            Recipient email address.
        subject (str):
            Subject line for the email.
        body (str):
            Plain-text body content of the email.
        attachments (list[str], optional):
            List of file system paths to attach to the email. Paths
            that are falsy or do not exist on disk are skipped.
            Defaults to None.

    Returns:
        tuple[bool, str | None]:
            A two-element tuple. The first element is True if the
            email was sent successfully, otherwise False. The second
            element is None on success, or a string describing the
            error on failure.
    """
    try:
        msg = EmailMessage()
        msg["Subject"] = subject
        msg["From"] = SENDER_EMAIL
        msg["To"] = to_email
        msg.set_content(body)

        if attachments:
            for attachment_path in attachments:
                if attachment_path and os.path.exists(attachment_path):
                    with open(attachment_path, "rb") as f:
                        file_data = f.read()
                        file_name = os.path.basename(attachment_path)

                    msg.add_attachment(
                        file_data,
                        maintype="application",
                        subtype="octet-stream",
                        filename=file_name
                    )

        with smtplib.SMTP("smtp.gmail.com", 587) as smtp:
            smtp.starttls()
            smtp.login(SENDER_EMAIL, APP_PASSWORD)
            smtp.send_message(msg)

        return True, None

    except Exception as e:
        return False, str(e)
