import 'package:nocoffeenocure/models/user.dart';
import 'package:objectbox/objectbox.dart';

import 'menuitem.dart';
import 'order.dart';

@Entity()
class CartItemOB {
  @Id()
  int id = 0;

  String? image; // don't write this, we don't use this anymore
  String? name; // don't write this, we don't use this anymore
  String? content; // don't write this, we don't use this anymore
  int? quantity;
  double price = 0;
  int? menuItem_id;

  @Backlink()
  var menuItemOB = ToMany<MenuItemOB>(); //already done
  final order = ToOne<OrderOB>(); //do this later
  final user = ToOne<UserOB>(); //do this later
}