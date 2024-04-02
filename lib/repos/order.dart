import '../backend/dummy/order.dart';
import '../backend/dummy/voucher.dart';
import '../common.dart';
import '../main.dart';
import '../models/order.dart';
import '../models/user.dart';
import '../models/voucher.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nocoffeenocure/repos/user.dart';

class OrderRepo {
  final box = objectbox.orderBox;

  void put(OrderOB order) {
    box.put(order);
  }

  void remove(int id) {
    box.remove(id);
  }

  OrderOB? getCurrentOrder() {
    UserOB? currentUser = UserRepo().getLoggedInUser();
    OrderOB? currentOrder = currentUser?.orders.firstWhere((order) => order.active == true);
    return currentOrder;
  }

  Future<void> putBackend(OrderOB order) async {
    //printToast("cartItem id = ${cartItem.id}");
    if (singletonUser.guest == false) {
      final url = onlineBackendURL + 'add_order';

      // just copy over the fields from singletonUser.order
      final Map<String, dynamic> data = {
        //required for user identification in Flask backend
        'user_id': singletonUser.userId,
        //proprietary fields of 'OrderOB'
        'orderId': order.orderId,
        'eta': order.eta,
        'orderPlaced': order.orderPlaced?.toIso8601String(), //datetime
        'status': order.status,
        'locationLongitude': order.locationLatitude,
        'locationLatitude': order.locationLatitude,
        'deliveryAddress': order.deliveryAddress,
        'phoneNumber': order.phoneNumber,
        'specialRequest': order.specialRequest,
        'packageString': order.packageString,
        'paymentMethod': order.paymentMethod,
        'onSitePickup': order.onSitePickup,
        'amount': order.amount,
        'sst': order.sst,
        'voucherDeduction': order.voucherDeduction,
        'subtotal': order.subtotal,
        'deliveryFee': order.deliveryAddress,
        'roundingAdjustment': order.roundingAdjustment,
        'appWalletDiscount': order.appWalletDiscount,
        'totalPrice': order.totalPrice,
        'active': order.active,
        // child objects
        'cartItems': order.cartItems.map((cartitem)=>cartitem.toJson()).toList(),
        'vouchers': order.vouchers.map((voucher)=>voucher.toJson()).toList(),
      };

      // Encode data to JSON
      final jsonData = json.encode(data);
      //
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
          print('Order added to backend successfully');
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
}
