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

  }

  //called by cartScreen.
  List<CartItemOB> getAll() {
    //new code (3/27/2024)
    return singletonUser.cartItems;
  }

  //called by menu_details
  void put(CartItemOB cartItem) {
    UserOB currentUser = singletonUser;
    currentUser?.cartItems.add(cartItem);
    print("current user id is ${currentUser?.userId}");
    UserRepo().box.put(currentUser);
    singletonUser = currentUser!;
  }

  Future<void> putBackend(CartItemOB cartItem) async {
    if (singletonUser.guest == false) {
      final url = onlineBackendURL + 'add_cartitem';

      final Map<String, dynamic> data = {
        'user_id' : singletonUser.userId.toString(),
        'id' : cartItem.id,
        'price' : cartItem.price,
        'quantity' : cartItem.quantity,
        'menuitem_id' : cartItem.menuItem_id,
        'menuitem': cartItem.menuItemOB.map((menuitem)=> menuitem.toJson()).toList(),
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

  Future<void> editBackend(CartItemOB cartItem) async {
    if (singletonUser.guest == false) {
      final url = onlineBackendURL + 'edit_cartitem';
      final Map<String, dynamic> data = {
        'user_id': singletonUser.userId.toString(),
        'id': cartItem.id,
        'price': cartItem.price,
        'quantity': cartItem.quantity,
        'menuitem_id': cartItem.menuItem_id,
        'menuitem': cartItem.menuItemOB.map((menuitem)=> menuitem.toJson()).toList(),
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
      print('Quantity: ${item.quantity ?? 0}');
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