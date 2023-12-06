import 'package:nocoffeenocure/repos/user.dart';

import '../backend/dummy/order.dart';
import '../backend/dummy/voucher.dart';
import '../main.dart';
import '../models/order.dart';
import '../models/user.dart';
import '../models/voucher.dart';

class OrderRepo {
  final box = objectbox.orderBox;

  void remove(int id) {
    box.remove(id);
  }

  //get order from user
  Future<void> update(BackendSource source) async {
    late final newData;
    late final currentData;

    if (source == BackendSource.dummy) {
      newData = await OrderDummy().get();
    }
    currentData = box.getAll();
    if (currentData.isNotEmpty) {
      print("replacing entries for DummyOB");
      box.removeAll();
      box.putMany(newData);
    }
    else {
      print("adding new entries for DummyOB");
      box.putMany(newData);
    }
  }

  OrderOB? getCurrentOrder() {
    UserOB? currentUser = UserRepo().getLoggedInUser();
    OrderOB? currentOrder = currentUser?.orders.firstWhere((order) => order.active == true);
    return currentOrder;
  }
}
