""" Copyright (c) 2026 ARCASCEND DIGITECH PRIVATE LIMITED. All rights reserved.
This file is part of the Donor Report Automation System (DRAS) project.
Author: Jerusha Caroline Raj A Created: 2026-06-30
Description: Configures URL routing for the dras_app application,
mapping each route (home, donor, fieldworker, upload, history, and
get_donor) to its corresponding view function. """

from django.urls import path

from . import views


urlpatterns = [

    path(

        "",

        views.home,

        name="home"

    ),

    path(

        "donor/",

        views.donor,

        name="donor"

    ),

    path(

        "fieldworker/",

        views.fieldworker,

        name="fieldworker"

    ),

    path(

        "upload/",

        views.upload,

        name="upload"

    ),

    path(

        "history/",

        views.history,

        name="history"

    ),
path(
    "get_donor/",
    views.get_donor,
    name="get_donor"
),
]