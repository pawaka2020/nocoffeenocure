import 'package:nocoffeenocure/models/user.dart';
import 'package:objectbox/objectbox.dart';
import '../common.dart';
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'voucher_id': voucher_id,
      'image': image,
      'priceDiscount': priceDiscount,
      'priceDeduct': priceDeduct,
      'expiryDate': expiryDate?.toIso8601String(),
      'activated': activated,
      // Assuming you want to include user and order details as well
      //'user': user.target.toJson(),
      //'order': order.target.toJson(),
    };
  }

  static List<VoucherOB> listFromJson(List<dynamic> jsonList) {
    List<VoucherOB> items = [];
    for (var json in jsonList) {
      items.add(VoucherOB.fromJson(json));
    }
    return items;
    //return [];
  }

  VoucherOB();

  factory VoucherOB.fromJson(Map<String, dynamic> json) {
    VoucherOB voucher = VoucherOB()
      ..voucher_id = json['voucher_id']
      ..image = onlineBackendURL + json['image']
      ..activated = json['activated']
      ..expiryDate = json['expiryDate'] != null ? DateTime.parse(json['expiryDate']) : null
      ..priceDeduct = json['priceDeduct'] != null ? double.parse(json['priceDeduct'].toString()) : null
      ..priceDiscount = json['priceDiscount'] != null ? double.parse(json['priceDiscount'].toString()) : null
    ;
    return voucher;
  }
}