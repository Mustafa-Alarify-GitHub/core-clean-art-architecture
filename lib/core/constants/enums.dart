/*
============================================================
                    ENUMS DEFINITIONS
============================================================

This file contains all global enums used across the project.

Purpose:
- Centralize all enums in one place
- Avoid hardcoded strings/numbers
- Improve maintainability
- Act as a single source of truth

============================================================
*/

// ================= Environment =================

enum Environments {
  dev,
  prod,
}

enum Order {
  asc,
  desc,
}

// ================= Sort =================

class SortByItem {
  final String key;
  final String label;

  const SortByItem(this.key, this.label);
}

class SortBy {
  static const popularityScore =
      SortByItem('popularity_score', 'الأكثر شعبية');
  static const salesRank = SortByItem('sales_rank', 'الأكثر مبيعاً');
  static const updatedAt = SortByItem('updated_at', 'تاريخ التحديث');
  static const price = SortByItem('price', 'السعر');
  static const createdAt = SortByItem('created_at', 'الأحدث');
  static const rand = SortByItem('rand', 'عشوائي');
  static const relevance = SortByItem('relevance', 'الأكثر صلة');
}

// ================= Sync =================

enum SyncStatus {
  synced,
  unsynced,
  syncWithError,
}

// ================= Shipping =================

enum ShippingType {
  countryToCountry,
  insideCountry,
  delivery,
}

// ================= Category =================

enum CategoryEnum {
  parent,
  lastChild,
}

// ================= Benefit =================

enum BenefitType {
  ratio,
  value,
}

// ================= Size =================

enum SizeGuide {
  required,
  notRequired,
  optional,
}

enum SizeEnum {
  original,
  lg,
  md,
  sm,
  thumbnail,
}

// ================= Row State =================

enum RowState {
  active,
  inactive,
  deleted,
}

// ================= Media =================

enum MediaType {
  image,
  video,
  audio,
  document,
  other,
}

// ================= Payment =================

enum TypePayment {
  paid,
  refunded,
}

enum StatePayment {
  failed,
  success,
}

// ================= Units =================

enum UnitTypeNumeric {
  box,
  piece,
}

enum UnitName {
  piece,
  box,
  kg,
  meter,
  cm,
  mm,
  liter,
  gram,
  ml,
  inch,
  foot,
  yard,
}

// ================= User =================

enum UserRole {
  admin,
  employee,
}

// ================= Attribute =================

enum AttributeType {
  field,
  page,
  card,
  button,
  menu,
  link,
}

// ================= Permission =================

enum PermissionType {
  show,
  hidden,
  disabled,
}

// ================= Source =================

enum SourceType {
  local,
  global,
}

// ================= Order =================

enum OrderType {
  local,
  global,
  both,
}

// ================= File =================

enum FileType {
  image,
  video,
  audio,
  document,
  other,
}

// ================= Product =================

enum ProductType {
  configurable,
  grouped,
  bundle,
  digital,
  subscription,
  variable,
  variation,
}

enum ProductStatus {
  copy,
  draft,
  pending,
  published,
  view,
  unpublished,
  archived,
  trashed,
}

enum ProductStatusEnum {
  draft,
  pending,
  publish,
  trash,
}

// ================= Store =================

enum StoreStatus {
  inStock,
  outOfStock,
  preOrder,
}

// ================= Price =================

enum PriceType {
  retail,
  wholesale,
  retailAtWholesale,
  special,
}

// ================= Connection =================

enum ConnectedType {
  product,
  category,
  mainSize,
}

// ================= Value =================

enum ValueType {
  boolean,
  number,
  string,
  percentage,
}

// ================= Location =================

enum LocationType {
  country,
  governorate,
  state,
  city,
  district,
  location,
  street,
  region,
}

// ================= Coupon =================

enum CouponDiscountType {
  fixed,
  percentage,
}

enum CouponState {
  active,
  inactive,
  expired,
  usedUp,
}

// ================= Address =================

enum AddressType {
  billing,
  shipping,
}

// ================= Payment Status =================

enum PaymentStatus {
  pending,
  paid,
  failed,
  canceled,
}

enum PaymentMode {
  api,
  manual,
}

enum FeeType {
  extra,
  discount,
}

enum PaymentLogType {
  paid,
  refunded,
}

enum PaymentLogState {
  failed,
  success,
}

// ================= Constants =================

const List<String> monthsAr = [
  'يناير',
  'فبراير',
  'مارس',
  'أبريل',
  'مايو',
  'يونيو',
  'يوليو',
  'أغسطس',
  'سبتمبر',
  'أكتوبر',
  'نوفمبر',
  'ديسمبر',
];

class FeeTypeCheckout {
  static const extra = 201;
  static const discount = 202;
}
