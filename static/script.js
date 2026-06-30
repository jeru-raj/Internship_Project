/* Copyright (c) 2026 ARCASCEND DIGITECH PRIVATE LIMITED. All rights reserved.
   This file is part of the Donor Report Automation System (DRAS) project.
   Author: Jerusha Caroline Raj A | Created: 2026-06-30
   Description: Shared front-end behaviour for the DRAS application shell,
   handling sidebar collapse on desktop and slide-in navigation on mobile. */

/* DRAS shared shell behaviour: sidebar collapse (desktop) + slide-in (mobile).
   Loaded on every page via partials/shell_end.html. */
(function () {
  "use strict";

  var sidebar = document.getElementById("sidebar");
  var collapseBtn = document.getElementById("collapseBtn");
  var mobileMenuBtn = document.getElementById("mobileMenuBtn");
  var overlay = document.getElementById("sidebarOverlay");

  if (!sidebar) return;

  var COLLAPSE_KEY = "dras_sidebar_collapsed";

  // Restore collapsed state (desktop only) using an in-memory fallback
  // since this UI may run in contexts where storage APIs are unavailable.
  var collapsedState = false;
  try {
    collapsedState = window.localStorage.getItem(COLLAPSE_KEY) === "1";
  } catch (e) {
    collapsedState = false;
  }
  if (collapsedState && window.innerWidth > 900) {
    sidebar.classList.add("is-collapsed");
  }

  if (collapseBtn) {
    collapseBtn.addEventListener("click", function () {
      sidebar.classList.toggle("is-collapsed");
      try {
        window.localStorage.setItem(
          COLLAPSE_KEY,
          sidebar.classList.contains("is-collapsed") ? "1" : "0"
        );
      } catch (e) {
        /* storage unavailable — collapse still works for this session */
      }
    });
  }

  function openMobileNav() {
    sidebar.classList.add("is-mobile-open");
    overlay.classList.add("is-visible");
  }

  function closeMobileNav() {
    sidebar.classList.remove("is-mobile-open");
    overlay.classList.remove("is-visible");
  }

  if (mobileMenuBtn) {
    mobileMenuBtn.addEventListener("click", openMobileNav);
  }
  if (overlay) {
    overlay.addEventListener("click", closeMobileNav);
  }

  window.addEventListener("resize", function () {
    if (window.innerWidth > 900) closeMobileNav();
  });
})();