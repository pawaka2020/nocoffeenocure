import 'package:flutter/foundation.dart';

class CartCountNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void addToCart() {
    _count++;
    print("Cart added, count = $_count");
    notifyListeners();
  }
  void removeFromCart() {
    if (_count > 0) {
      _count--;
      print("Cart removed");
      notifyListeners();
    }
  }
}