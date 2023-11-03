import 'package:objectbox/objectbox.dart';

@Entity()
class CartItemOB {
  @Id()
  int id = 0;

  String? image;
  String? name;
  String? content;
  int? quantity;
  int? menuItem_id;
}