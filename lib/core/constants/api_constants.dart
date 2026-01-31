/*
============================================================
                    API ROUTES
============================================================

Base URL for all API requests.
Change this value depending on the environment:

- Development: http://127.0.0.1:8000
- Production : https://api.example.com

============================================================
*/

class ApiRoutes {
  static const String apiConfig = "";
  // ================= Currency =================

  static const String allCurrency = '$apiConfig/currency/all';

  // ================= Products =================

  static const String productBySlug = '$apiConfig/products/slug';

  static const String productByListIds = '$apiConfig/filtered_products/by_ids';

  static const String productSizeGuide = '$apiConfig/products/size';

  static const String filteredProducts = '$apiConfig/filtered_products/filter';

  static const String categoryPriceRange =
      '$apiConfig/filtered_products/category_price_range';

  static const String videos = '$apiConfig/products/videos';

  // ================= Payment =================

  static const String allPaymentByCurrency =
      '$apiConfig/payment/payment_methods_currency_with_currency';

  static const String allPaymentByLocation =
      '$apiConfig/payment/payment_methods_currency_with_location';

  static const String paymentAccountsById =
      '$apiConfig/payment/payment-accounts/by-currency';

  static const String pay = '$apiConfig/orders/pay';

  static const String paymentLog = '$apiConfig/payment/payment-loges/';

  // ================= Cart =================

  static const String cart = '$apiConfig/cart/items';

  static const String deleteCart = '$apiConfig/cart/items/delete';

  static const String cartClient = '$apiConfig/cart/items/logout';

  // ================= Orders =================

  static const String orderFilter = '$apiConfig/orders/filter';

  static const String order = '$apiConfig/orders/';

  // ================= Comments =================

  static const String comments = '$apiConfig/comments/';

  // ================= Favorites =================

  static const String favorite = '$apiConfig/favorite/';

  // ================= Status =================

  static const String statusGroup = '$apiConfig/status_groups/';

  // ================= Address =================

  static const String allAddress = '$apiConfig/addresses/customer';

  static const String address = '$apiConfig/addresses/';

  // ================= Location =================

  static const String locationTree = '$apiConfig/location/tree';

  // ================= Coupon =================

  static const String checkCoupon = '$apiConfig/coupons/by-code';

  // ================= Checkout =================

  static const String checkout = '$apiConfig/checkout/';

  // ================= Files =================

  static const String uploadImage = '$apiConfig/files/rest/upload/single';

  static const String updateImage = '$apiConfig/files/rest';

  // ================= Auth =================

  static const String signup = '$apiConfig/customer-auth/create';

  static const String login = '$apiConfig/customer-auth/login';

  static const String verifyCode = '$apiConfig/customer-auth/verify-email';

  static const String resendVerifyCode =
      '$apiConfig/customer-auth/resend-verification';

  static const String resendVerifyCodeForgetPass =
      '$apiConfig/customer-auth/forgot-password';

  static const String checkVerifyCode =
      '$apiConfig/customer-auth/verify-forgot-code';

  static const String resetPassword = '$apiConfig/customer-auth/reset-password';

  static const String logout = '$apiConfig/customer-auth/logout';

  // ================= Customer =================

  static const String customerMe = '$apiConfig/customers/me';

  static const String updateCustomerMe = '$apiConfig/customers/';

  static const String sendVerifyDeleteCode =
      '$apiConfig/customers/send-verify-delete-code';

  static const String deleteCustomer = '$apiConfig/customers/';

  static const String changePassword = '$apiConfig/customers/change-password';

  // ================= Categories =================

  static const String allCategories = '$apiConfig/category/categories/tree';
}
