import 'package:nocoffeenocure/models/user.dart';
import 'package:nocoffeenocure/models/voucher.dart';
import 'package:objectbox/objectbox.dart';

import 'cartitem.dart';

@Entity()
class OrderOB {
  @Id()
  int id = 0;

  int? orderId; // id for the order, used by rider and user for identification.
  int? eta;
  DateTime? orderPlaced; // should be in minutes only. even though we still have 00:00:00 as a display.
  String? status; // one of the following: Preparing, Out for Delivery, Arrived, Canceled.
  //?? something to be linked to a GPS service to allow user to track the rider's vehicle delivering the order.
  double? locationLongitude;
  double? locationLatitude;
  //extra
  double? totalPrice;
  String? deliveryAddress;
  String? phoneNumber;
  String? specialRequest;
  String? packageString;
  String? PaymentMethod;
  bool? onSitePickup;
  //payment details
  double? amount;
  double? sst;
  double? voucherDeduction;
  double? subtotal;
  double? deliveryFee;
  double? roundingAdjustment;
  double? appWalletDiscount;
  //for identifying the only active order for a user.
  //user is only allowed one active order at a time, though it can have multiple
  //orders for bookkeeping purposes.
  bool? active;

  @Backlink()
  final cartItems = ToMany<CartItemOB>();
  @Backlink()
  final vouchers = ToMany<VoucherOB>();
  final user = ToOne<UserOB>();
}