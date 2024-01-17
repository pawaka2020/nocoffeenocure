import 'package:nocoffeenocure/models/user.dart';
import 'package:nocoffeenocure/repos/user.dart';

import '../backend/dummy/cartitem.dart';
import '../common.dart';
import '../main.dart';
import '../models/cartitem.dart';
import '../models/menuitem.dart';
import '../models/order.dart';
import 'menuitem.dart';
import 'order.dart';

class CartItemRepo {
  final box = objectbox.cartItemBox;

  Future<void> update(BackendSource source) async {
    // late final newData;
    // late final currentData;
    //
    // if (source == BackendSource.dummy) {
    //   newData = await CartItemDummy().get();
    // }
    // currentData = box.getAll();
    // if (currentData.isNotEmpty) {
    //   print("replacing for CartItemOB");
    //   box.removeAll(); //the id of 'box' does not reset to 0.
    //   box.putMany(newData);
    // }
    // else {
    //   print("adding for CartItemOB");
    //   box.putMany(newData);
    // }
    //testPrint();

    //List<CartItemOB> ordercartitems = box2.getAll();
    //printToast("ordercartitems length = ${ordercartitems.length}");
    // List<CartItemOB> ordercartitems = box.getAll();
    // printToast("ordercartitems length = ${ordercartitems.length}");
    // UserOB? currentUser = UserRepo().getLoggedInUser();
    // if (currentUser?.orders.length != 0) {
    //   OrderOB? currentorder = OrderRepo().getCurrentOrder();
    //   currentorder?.cartItems.addAll(ordercartitems);
    // }
    //UserOB? currentUser = UserRepo().getLoggedInUser();
    // if (currentUser?.cartItems.length != 0) {
    //   printToast("cart items length = ${currentUser?.cartItems.length}");
    // }
    // else {
    //   printToast("cart items zero");
    // }
    // for (var item in currentUser!.cartItems) {
    //   if (item.user.target != null)
    //     printToast("cart item attached to user detected");
    // }
  }

  //called by cartScreen.
  List<CartItemOB> getAll() {
    //return box.getAll();

    UserOB? currentUser = UserRepo().getLoggedInUser();
    List<CartItemOB> cartItems = currentUser!.cartItems;
    return cartItems;

    List<MenuItemOB> menuItems = MenuItemRepo().getAllOB();
    // List<CartItemOB> cartItems = box.getAll();
    // for (var item in cartItems) {
    //   item.menuItemOB.addAll(menuItems);
    // }
    // UserOB? currentUser = UserRepo().getLoggedInUser();
    // currentUser?.cartItems.addAll(cartItems);
    // UserRepo().box.put(currentUser);
    // return cartItems;
  }

  //called by menu_details
  void put(CartItemOB cartItem){
    //box.put(cartItem);
    //MenuItemRepo().put(cartItem.menuItemOB[0]);
    //currentUser.orders.add(newOrder);

    UserOB? currentUser = UserRepo().getLoggedInUser();
    currentUser?.cartItems.add(cartItem);
    UserRepo().box.put(currentUser);
  }

  void remove(int id) {
    //box.remove(id);
    UserOB? currentUser = UserRepo().getLoggedInUser();
    currentUser?.cartItems.removeWhere((element) => element.id == id);
    UserRepo().box.put(currentUser);
  }

  void testPrint() {
    List<CartItemOB> list = getAll();
    for (var item in list) {
      print('Cart Item ID: ${item.id}');
      // print('Image: ${item.menuItemOB[0].imagePath ?? 'N/A'}');
      // print('Name: ${item.menuItemOB[0]. ?? 'N/A'}');
      // print('Content: ${item.content ?? 'N/A'}');
      print('Quantity: ${item.quantity ?? 0}');
      // print('MenuItem ID: ${item.menuItem_id ?? 0}');
      print('---------------------------');
    }
  }

  void flushUserCartItems() {
    UserOB? currentUser = UserRepo().getLoggedInUser();
    //currentUser?.cartItems.removeWhere((cartItem) => cartItem.user.target != null);
    currentUser?.cartItems.removeWhere((cartItem) => cartItem.user.target != currentUser);
    UserRepo().box.put(currentUser);
  }
}