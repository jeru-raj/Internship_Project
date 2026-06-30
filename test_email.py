""" Copyright (c) 2026 ARCASCEND DIGITECH PRIVATE LIMITED. All rights reserved.
This file is part of the Donor Report Automation System (DRAS) project.
Author: Jerusha Caroline Raj A Created: 2026-06-30
Description: Standalone manual test script for verifying that the
emailsender module can successfully send a test email using the
configured Gmail SMTP credentials. """

from dras_app.emailsender import send_email  # we will fix import if needed

success, error = send_email(
    to_email="yourtestemail@gmail.com",
    subject="Test Email",
    body="Hello from DRAS"
)

print(success, error)