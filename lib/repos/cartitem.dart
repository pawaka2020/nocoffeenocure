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
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  void put(CartItemOB cartItem) {
    //box.put(cartItem);
    //MenuItemRepo().put(cartItem.menuItemOB[0]);
    //currentUser.orders.add(newOrder);

    UserOB? currentUser = UserRepo().getLoggedInUser();
    currentUser?.cartItems.add(cartItem);
    UserRepo().box.put(currentUser);

    //11/3/2024 I need to update the singleton as well.
    singletonUser = currentUser!;
    //13/3/2024
    //putBackend(cartItem);

    //TODO: Write the cartitem object to user in postgreSQL database attached to Flask backend

  }

  Future<void> putBackend(CartItemOB cartItem) async {
    //printToast("cartItem id = ${cartItem.id}");
    if (singletonUser.guest == false) {
      //final url = onlineBackendURL + 'add_cart_user';
      final url = onlineBackendURL + 'add_cartitem';

      final Map<String, dynamic> data = {
        'user_id' : singletonUser.userId.toString(),
        'id' : cartItem.id,
        'price' : cartItem.price,
        'quantity' : cartItem.quantity,
        'menuitem_id' : cartItem.menuItem_id,
        'menuitem': cartItem.menuItemOB.map((menuitem)=> menuitem.toJson()).toList(),
      };

      // Encode data to JSON
      final jsonData = json.encode(data);

      try
      {
        final response = await http.post(
          Uri.parse(url),
          headers: <String, String> {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonData,
        );
        if (response.statusCode == 200) {
          print('Cartitem added to backend successfully');
        }
        else {
          print('Failed to update user: ${response.statusCode}');
        }
      }
      catch (e) {
        print('Exception caught while updating user: $e');
      }

    }
  }

  Future<void> editBackend(CartItemOB cartItem) async {
    if (singletonUser.guest == false) {
      //final url = onlineBackendURL + 'edit_cart_user';
      final url = onlineBackendURL + 'edit_cartitem';
      final Map<String, dynamic> data = {
        'user_id': singletonUser.userId.toString(),
        'id': cartItem.id,
        'price': cartItem.price,
        'quantity': cartItem.quantity,
        'menuitem_id': cartItem.menuItem_id,
        'menuitem': cartItem.menuItemOB.map((menuitem)=> menuitem.toJson()).toList(),
        // cartitem child objects (TODO)
      };
      // Encode data to JSON
      final jsonData = json.encode(data);

      try
      {
        final response = await http.post(
          Uri.parse(url),
          headers: <String, String> {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonData,
        );
        if (response.statusCode == 200) {
          print('Cartitem added to backend successfully');
        }
        else {
          print('Failed to update user: ${response.statusCode}');
        }
      }
      catch (e) {
        print('Exception caught while updating user: $e');
      }
    }
  }

  Future<void> deleteBackend(int id) async {
    if (singletonUser.guest == false) {
      //final url = onlineBackendURL + 'delete_cart_user';
      final url = onlineBackendURL + 'delete_cartitem';
      final Map<String, dynamic> data = {
        'user_id' : singletonUser.userId.toString(),
        'id' : id,
      };

      final jsonData = json.encode(data);

      try
      {
        final response = await http.post(
          Uri.parse(url),
          headers: <String, String> {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonData,
        );
        if (response.statusCode == 200) {
          print('Cartitem added to backend successfully');
        }
        else {
          print('Failed to update user: ${response.statusCode}');
        }
      }
      catch (e) {
        print('Exception caught while updating user: $e');
      }
    }
  }

  void remove(int id) {
    //box.remove(id);
    UserOB? currentUser = UserRepo().getLoggedInUser();
    currentUser?.cartItems.removeWhere((element) => element.id == id);
    //12/3/2024
    singletonUser = currentUser!;
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