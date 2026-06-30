#!/usr/bin/env python
""" Copyright (c) 2026 ARCASCEND DIGITECH PRIVATE LIMITED. All rights reserved.
This file is part of the Donor Report Automation System (DRAS) project.
Author: Jerusha Caroline Raj A Created: 2026-06-30
Description: Django's command-line utility for administrative tasks,
used to run the development server, apply migrations, and invoke
custom management commands such as send_reports. """
import os
import sys


def main():
    """Runs administrative tasks for the dras_project Django project.

    Sets the ``DJANGO_SETTINGS_MODULE`` environment variable to point
    at ``dras_project.settings`` and dispatches the command-line
    arguments to Django's management command execution entry point.

    Raises:
        ImportError:
            If Django cannot be imported, typically indicating it is
            not installed or the virtual environment is not active.
    """
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'dras_project.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == '__main__':
    main()
