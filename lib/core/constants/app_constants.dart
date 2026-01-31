/*
============================================================
              GLOBAL APPLICATION CONSTANTS
============================================================

This file contains general-purpose constants used across the app,
including timing values, default settings, UI behavior, and IDs.

All constants here are environment-independent and safe to use
across the entire application.

============================================================
*/

class AppConstants {
  static const baseUrl = 'https://api.yourdomain.com';
  static const appName = 'قافله كوم';
  // ================= Network =================

  /// Request timeout duration for API calls (in milliseconds).
  /// Helps prevent hanging requests or long waits.
  static const int timeout = 180;
  static const int receive = 180;

  // ================= Product Variations =================

  /// Product variation labels that should display images instead of text.
  /// Example: color, design, options...
  static const List<String> variationShowImages = [
    "اللون",
    "التشكيلة",
    "نوع المنفذ",
    "عدد القطع",
  ];

  // ================= Cart =================

  /// Delay time for asynchronous cart updates (in milliseconds).
  static const int settingAsyncCart = 2000;

  // ================= Localization =================

  /// Default country ID
  static const int idChina = 543;

  // ================= WhatsApp =================

  /// Default WhatsApp phone number
  static const String numberPhoneWhatsApp = "";

  // ================= Storage =================

  /// Version identifier for local storage data
  static const String versionLocalStorage = "v1.0";

  // ================= Payment =================

  /// Cash on delivery IDs
  static const int idCashOnDeliveryForNewYemen = 48;
  static const int idCashOnDeliveryForOldYemen = 49;

  // ================= Order Status =================

  static const int idStatusCancel = 12;
  static const int idStatusPadding = 1;

  // ================= Comments =================

  /// Maximum number of images allowed in comments
  static const int maxImagesComments = 3;
}
