

import '../backend/dummy/cartitem.dart';
import '../main.dart';
import '../models/cartitem.dart';

class CartItemRepo {
  final box = objectbox.cartItemBox;

  void remove(int id) {
    box.remove(id);
  }

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

  List<CartItemOB> getAll() {
    return box.getAll();
  }

  void testPrint() {
    List<CartItemOB> list = getAll();
    for (var item in list) {
      print('Cart Item ID: ${item.id}');
      print('Image: ${item.image ?? 'N/A'}');
      print('Name: ${item.name ?? 'N/A'}');
      print('Content: ${item.content ?? 'N/A'}');
      print('Quantity: ${item.quantity ?? 0}');
      print('MenuItem ID: ${item.menuItem_id ?? 0}');
      print('---------------------------');
    }
  }
}