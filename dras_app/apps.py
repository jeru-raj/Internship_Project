""" Copyright (c) 2026 ARCASCEND DIGITECH PRIVATE LIMITED. All rights reserved.
This file is part of the Donor Report Automation System (DRAS) project.
Author: Jerusha Caroline Raj A Created: 2026-06-30
Description: Django application configuration for the dras_app app,
registering it with the project's INSTALLED_APPS. """

from django.apps import AppConfig


class DrasAppConfig(AppConfig):
    """Application configuration for the dras_app Django app.

    Registers the ``dras_app`` application with Django so that its
    models, views, and management commands are discovered and loaded
    as part of the DRAS project.

    Attributes:
        name (str):
            The Python path of the application, ``'dras_app'``.
    """

    name = 'dras_app'
