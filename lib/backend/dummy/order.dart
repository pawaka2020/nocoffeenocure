import '../../models/order.dart';
import '../../models/voucher.dart';

class OrderDummy {
  Future<List<OrderOB>> get() async {
    int delay = 0;

    await Future.delayed(Duration(seconds: delay));
    List<OrderOB> result = [];
    return result;
  }
}