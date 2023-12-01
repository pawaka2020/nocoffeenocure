import 'package:nocoffeenocure/models/user.dart';
import 'package:objectbox/objectbox.dart';

import 'menuitem.dart';
import 'order.dart';

@Entity()
class CartItemOB {
  @Id()
  int id = 0;

  String? image; //we don't use this anymore
  String? name; // we don't use this anymore
  String? content;
  int? quantity;
  int? menuItem_id;
  double price = 0;

  @Backlink()
  var menuItemOB = ToMany<MenuItemOB>();
  final order = ToOne<OrderOB>();
  final user = ToOne<UserOB>();
}