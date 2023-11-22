import '../../models/cartitem.dart';
import '../../models/menuitem.dart';

class CartItemDummy {
  Future<List<CartItemOB>> get() async {
    int delay = 0;
    await Future.delayed(Duration(seconds: delay));

    List<CartItemOB> result = [];
    return result;
  }
}