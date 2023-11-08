import 'package:objectbox/objectbox.dart';

import 'menuitem.dart';

@Entity()
class CartItemOB {
  @Id()
  int id = 0;

  String? image;
  String? name;
  String? content;
  int? quantity;
  int? menuItem_id;
  double price = 0;

  @Backlink()
  var menuItemOB = ToMany<MenuItemOB>();
}