import 'package:nocoffeenocure/models/user.dart';
import 'package:nocoffeenocure/models/voucher.dart';
import 'package:objectbox/objectbox.dart';

import 'cartitem.dart';

@Entity()
class OrderOB {
  @Id()
  int id = 0;

  int? orderId; // id for the order, used by rider and user for identification.
  DateTime? eta; // should be in minutes only. even though we still have 00:00:00 as a display.
  String? status; // one of the following: Preparing, Out for Delivery, Arrived, Canceled.
  //?? something to be linked to a GPS service to allow user to track the rider's vehicle delivering the order.
  double? locationLongitude;
  double? locationLatitude;
  //extra
  double? totalPrice;
  String? deliveryAddress;
  String? phoneNumber;
  bool? onSitePickup;

  //one order can have multiple cart items
  //allow users to place review on each individual cart item and for
  @Backlink()
  final cartItems = ToMany<CartItemOB>();
  @Backlink()
  final vouchers = ToMany<VoucherOB>();
  final user = ToOne<UserOB>();
}