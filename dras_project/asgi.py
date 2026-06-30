""" Copyright (c) 2026 ARCASCEND DIGITECH PRIVATE LIMITED. All rights reserved.
This file is part of the Donor Report Automation System (DRAS) project.
Author: Jerusha Caroline Raj A Created: 2026-06-30
Description: ASGI entry point for the dras_project project, exposing
the ASGI application callable used by asynchronous application servers.

ASGI config for dras_project project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/6.0/howto/deployment/asgi/
"""

import os

from django.core.asgi import get_asgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'dras_project.settings')

application = get_asgi_application()
