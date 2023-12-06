import 'package:nocoffeenocure/models/user.dart';
import 'package:nocoffeenocure/repos/user.dart';

import '../backend/dummy/cartitem.dart';
import '../main.dart';
import '../models/cartitem.dart';

class CartItemRepo {
  final box = objectbox.cartItemBox;

  Future<void> update(BackendSource source) async {
    late final newData;
    late final currentData;

    if (source == BackendSource.dummy) {
      newData = await CartItemDummy().get();
    }
    currentData = box.getAll();
    if (currentData.isNotEmpty) {
      print("replacing for CartItemOB");
      box.removeAll(); //the id of 'box' does not reset to 0.
      box.putMany(newData);
    }
    else {
      print("adding for CartItemOB");
      box.putMany(newData);
    }
    //testPrint();
  }

  //called by cartScreen.
  List<CartItemOB> getAll() {
    //return box.getAll();
    UserOB? currentUser = UserRepo().getLoggedInUser();
    List<CartItemOB> cartItems = currentUser!.cartItems;
    //return cartItems;
    return UserRepo().getLoggedInUser()!.cartItems;
  }

  //called by menu_details
  void put(CartItemOB cartItem){
    //box.put(cartItem);
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


}