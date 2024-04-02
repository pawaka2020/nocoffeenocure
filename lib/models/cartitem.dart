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

  CartItemOB();

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'quantity' : quantity,
      'price' : price,
      'menuitem_id' : menuItem_id,
      'menuitem' : menuItemOB.map((menuitem) => menuitem.toJson()).toList(),
    };
  }

  //code fromJson() here (TODO)

  //code listFromJson() here (TODO)

  // Define a fromJson method to create a CartItemOB instance from JSON data
  factory CartItemOB.fromJson(Map<String, dynamic> json) {
    final cartitem = CartItemOB()
      ..id = json['id'] ?? 0
      ..quantity = json['quantity'] ?? ''
      ..price = json['price'] ?? 0
      ..menuItem_id = json['menuitem_id'] ?? 0
    ;
    cartitem.menuItemOB.addAll(MenuItemOB.listFromJson(json['menuitem']) ?? []); //MenuItemOB.listFromJson(json['cart_item'])

    return cartitem;
  }

  // Define a listFromJson method to create a list of CartItemOB instances from a list of JSON data
  static List<CartItemOB> listFromJson(List<dynamic> jsonList) {
    List<CartItemOB> items = [];
    for (var json in jsonList) {
      items.add(CartItemOB.fromJson(json));
    }
    return items;
  }
}