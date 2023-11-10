import 'package:objectbox/objectbox.dart';

//recommended size 440 x 100
@Entity()
class VoucherOB {
  @Id()
  int id = 0;

  String? image;
  double? priceDiscount;
  double? priceDeduct;
  DateTime? expiryDate;

  bool? activated;
}