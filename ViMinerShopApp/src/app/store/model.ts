export interface User {
  email: string;
  firstname: string;
  lastname: string;
  telephone: string;
  mobile: string;
  username: string;
  userimage: string;
  useraddresss: Array<UserAddresss>;
  shoppingsessions: Array<ShoppingSession>;
  issubscribedtomailing: boolean;
  referralby: string;
  referralcode: string;
}

export interface ShippingMethod {
  id: number;
  name: string;
  shortname: string;
}

export interface UserAddresss {
  id: number;
  address: string;
  city: string;
  country: string;
  mobile: string;
  postal_code: string;
  street_name: string;
  telephone: string;
  user_id: number;
  isdefault: boolean;
}

export interface ProductCategory {
  id: number;
  name: string;
  desc: string;
  image: string;
  slug: string;
  updated_at: string;
  created_at: string;
}

export interface ProductVariant {
  id: number;
  price: number;
  thumb: string;
  stock: number;
  color: Color;
}

export interface ProductDetail {
  id: number;
  name: string;
  url: string;
  sku: string;
  desc: string;
  price: number;
  pricepromotion: number;
  detaildesc: string;
  category_id: number;
  productcategory: ProductCategory;
  algorithm: Algorithm;
  productinventory: productinventory;
  productimages: Array<productImage>;
  notedesc: string;
  paymentdesc: string;
  warrantydesc: string;
  isactive: boolean;
}

export interface SlideImage {
  id: number;
  name: string;
  fillcolor: string;
  imgurl: string;
  jumpto: string;
}

export interface HPNotice {
  id: number;
  title: string;
  content: string;
}

export interface productImage {
  id: number;
  alt_name: string;
  imageurl: string;
  created_at: string;
  updated_at: string;
}

export interface Algorithm {
  id: number;
  name: string;
  desc: string;
  slug: string;
  created_at: string;
  updated_at: string;
}

export interface productinventory {
  id: number;
  quantity: number;
  created_at: string;
  updated_at: string;
}

export interface Color {
  name: string;
  hex: string;
}

export interface Colors {
  color: Color;
}

export interface CartItem {
  id: number;
  url: string;
  name: string;
  price: number;
  amount: number;
  thumb: string;
  stock: number;
  color: Color;
}

export interface Discount {
  discountPercent: number;
  status: number;
}

export interface Cart {
  id: number;
  product: ProductDetail;
  product_id: number;
  quantity: number;
  session_id: number;
  created_at: string;
  updated_at: string;
}

export interface ShoppingSession {
  id: number;
  total: number;
  cartitems: Array<Cart>;
  coupon_id: number;
  coupon: Coupon;
  created_at: string;
  updated_at: string;
  user_id: number;
}

export interface Shipping {
  shipAddress: string;
  billingAddress: string;
  city: string;
  state: string;
  zip: string;
  country: string;
}

export interface Payment {
  cardOwner: string;
  cardNo: string;
  cardExp: {
    month: string;
    year: string;
  };
  cardCCV: string;
}

export interface Checkout {
  id: number;
  user_id: string;
  total: string;
  payment_id: string;
  paymentdetail: PaymentDetail;
  shippingMethod_id: number;
  shippingMethod: ShippingMethod;
  shippingAddress: string;
  created_at: string;
  updated_at: string;
  orderitems: Array<OrderItem>;
  shippingamount: number;
  discountamount: number;
  couponamount: number;
  subtotal: number;
}

export interface PaymentProvider {
  id: number;
  name: string;
  desc: string;
  created_at: string;
  updated_at: string;
}

export interface OrderItem {
  id: number;
  product_id: number;
  product: ProductDetail;
  quantity: number;
  created_at: string;
  updated_at: string;
}

export interface PaymentDetail {
  id: number;
  amount: number;
  provider: number;
  status: number;
}

export interface OrderItems {
  url: string;
  name: string;
  price: number;
  cargoPrice: number;
  thumb: string;
  amount: number;
  category: { name: string };
  color: Color;
}

export interface Orders {
  id: number;
  billingaddress: string;
  totalprice: number;
  date: number;
  discount: Discount;
  orderitems: Array<OrderItems>;
  paymentdetail: PaymentDetail;
  locationname: string;
  latitute: string;
  logitute: string;
  created_at: string;
  updated_at: string;
}


export interface Showcase {
  newMiner: Array<ProductDetail>;
  bestMiner: Array<ProductDetail>;
  interested: Array<ProductDetail>;
}

export class repairItemT {
  id: string;
  categoryName: string;
  categoryId: number;
  productName: string;
  productId: number;
  quantity: number;
  remark: string;
}

export class Repair {
  id: number;
  user_id: number;
  status: number;
  ticketreason: string;
  repairitem: Array<RepairItem>;
  trackingno: string;
  shippinglogisticsid: number;
  customeraddress: string;
  repairsiteid: string;
  repairsite: RepairSite;
  returnlogisticsid: number;
  remark: string;
  created_at: string;
  updated_at: string;
  repairorder: RepairOrder;
}

export class RepairOrder {
  id: number;
  repair_id: number;
  status: number;
  provider: number;
  price: number;
  created_at: string;
  updated_at: string;
}

export class RepairSite {
  code: string;
  name: string;
  extrainfo: string;
  note: string;
}

export class RepairItem {
  repairid: number;
  product_id: string;
  product: ProductDetail;
  quantity: number;
  remark: string;
}

export class Coupon {
  active: boolean;
  couponcode: string;
  couponpercent: number;
  coupontype: string;
  created_at: string;
  desc: string;
  expired_at: string;
  id: number;
  minprice: number;
  updated_at: string;
  user_id: number;
  couponleft: number;
}

export class CouponDonate {
  id: number;
  transactionid: string;
  user_id: number;
  receiverid: number;
  couponid: string;
  couponname: string;
  couponpercent: string;
  quantity: number;
  created_at: string;
  updated_at: string;
}

export class UserRecord {
  id: number;
  user_id: number;
  activityname: string;
  useragent: string;
  loglevel: number;
  ip: string;
  created_at: string;
}

export class PaypalLink {
  href: string;
  method: string;
  rel: string;
  title: string;
}

export class PaypalPayerAddress {
  address_line_1: string;
  admin_area_1: string;
  admin_area_2: string;
  country_code: string;
  postal_code: string;
}

export class PaypalPayerName {
  given_name: string;
  surname: string;
}

export class PaypalPayerPhoneNumber {
  national_number: string;
}

export class PaypalPayerPhone {
  phone_number: PaypalPayerPhoneNumber;
}

export class PaypalPayer {
  address: PaypalPayerAddress;
  email_address: string;
  name: PaypalPayerName;
  payer_id: string;
  phone: PaypalPayerPhone;
}

export class PaypalPurchaseUnitAmountBreakdownInsurance {
  currency_code: string;
  value: string;
}

export class PaypalPurchaseUnitAmountBreakdownHandling {
  currency_code: string;
  value: string;
}

export class PaypalPurchaseUnitAmountBreakdownItemTotal {
  currency_code: string;
  value: string;
}

export class PaypalPurchaseUnitAmountBreakdownShipping {
  currency_code: string;
  value: string;
}

export class PaypalPurchaseUnitAmountBreakdownShippingDiscount {
  currency_code: string;
  value: string;
}

export class PaypalPurchaseUnitAmountBreakdown {
  handling: PaypalPurchaseUnitAmountBreakdownHandling;
  insurance: PaypalPurchaseUnitAmountBreakdownInsurance;
  item_total: PaypalPurchaseUnitAmountBreakdownItemTotal;
  shipping: PaypalPurchaseUnitAmountBreakdownShipping;
  shipping_discount: PaypalPurchaseUnitAmountBreakdownShippingDiscount;
}

export class PaypalPurchaseUnitAmount {
  breakdown: PaypalPurchaseUnitAmountBreakdown;
  currency_code: string;
  value: string;
}

export class PaypalPurchaseUnitItemTax {
  currency_code: string;
  value: string;
}

export class PaypalPurchaseUnitItemUnitAmount {
  currency_code: string;
  value: string;
}

export class PaypalPurchaseUnitItem {
  name: string;
  quantity: string;
  tax: PaypalPurchaseUnitItemTax;
  unit_amount: PaypalPurchaseUnitItemUnitAmount;
}

export class PaypalPurchaseUnitPayee {
  email_address: string;
  merchant_id: string;
}

export class PaypalPurchaseUnitPaymentCapturesAmount {
  currency_code: string;
  value: string;
}

export class PaypalPurchaseUnitPaymentCapturesSellerProtection {
  dispute_categories: Array<string>;
  status: string;
}

export class PaypalPurchaseUnitPaymentCaptures {
  amount: PaypalPurchaseUnitPaymentCapturesAmount;
  create_time: string;
  final_capture: Boolean;
  id: string;
  links: Array<PaypalLink>;
  seller_protection: PaypalPurchaseUnitPaymentCapturesSellerProtection;
  status: string;
  update_time: string;
}

export class PaypalPurchaseUnitPayment {
  captures: Array<PaypalPurchaseUnitPaymentCaptures>;
}

export class PaypalPurchaseUnitShippingAddress {
  address_line_1: string;
  admin_area_1: string;
  admin_area_2: string;
  country_code: string;
  postal_code: string;
}

export class PaypalPurchaseUnitShippingName {
  full_name: string;
}

export class PaypalPurchaseUnitShipping {
  address: PaypalPurchaseUnitShippingAddress;
  name: PaypalPurchaseUnitShippingName;
}

export class PaypalPurchaseUnit {
  amount: PaypalPayerAddress;
  description: string;
  items: Array<PaypalPurchaseUnitItem>;
  payee: PaypalPurchaseUnitPayee;
  payments: PaypalPurchaseUnitPayment;
  reference_id: string;
  shipping: PaypalPurchaseUnitShipping;
  soft_descriptor: string;
}

export class PaypalSuccess {
  create_time: string;
  id: string;
  intent: string;
  links: Array<PaypalLink>;
  payer: PaypalPayer;
  purchase_units: Array<PaypalPurchaseUnit>;
  status: string;
  update_time: string;
}

export class MaxMinesSuccessPayment {
  BillCode: string;
  ContractID: string;
  hashpaid: string;
  isSandbox: string;
  success: boolean;
  unixtime: string;
}

export class processImage {
  imageurl: string;
  alt_name: string;
}

export class RoleVar {
  Id: number;
  RoleName: string;
  IsAdmin: string;
  IsSeller: string;
}

export class UserPoint {
  balance: number;
  point: number;
}

export class AdminDashboardData {
  orderHistory: Array<Orders>;
  totalIncome: number;
  totalOrder: number;
  totalMiner: number;
}

export class UserAuthenticate {
  id: number;
  email: string;
  username: string;
  firstname: string;
  lastname: string;
  rolevar_id: number;
  isactive: boolean;
  token: string;
}
