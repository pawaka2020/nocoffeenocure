import 'package:nocoffeenocure/models/user.dart';
import 'package:objectbox/objectbox.dart';
import 'order.dart';

//recommended size 440 x 100
@Entity()
class VoucherOB {
  @Id()
  int id = 0;

  int? voucher_id;
  String? image;
  double? priceDiscount;
  double? priceDeduct;
  DateTime? expiryDate;

  bool? activated;

  final user = ToOne<UserOB>();
  final order = ToOne<OrderOB>();
}