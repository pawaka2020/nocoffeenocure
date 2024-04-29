import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/orderdetails/itemcard.dart';
import 'package:nocoffeenocure/screens/orderdetails/packaging.dart';
import 'package:nocoffeenocure/screens/orderdetails/paymentdetails.dart';
import 'package:nocoffeenocure/screens/orderdetails/paymentmethod.dart';
import 'package:nocoffeenocure/screens/orderdetails/phonenumber.dart';
import 'package:nocoffeenocure/screens/orderdetails/specialrequest.dart';
import 'package:nocoffeenocure/screens/orderdetails/totalpricedisplay.dart';
import 'package:nocoffeenocure/screens/orderdetails/voucherdisplay.dart';
import '../../common.dart';
import '../../main.dart';
import '../../models/cartitem.dart';
import '../../models/order.dart';
import '../../models/user.dart';
import 'address.dart';

class OrderDetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    UserOB? currentUser = singletonUser;
    OrderOB? currentOrder = currentUser.orders.firstWhere((order) => order.active == true);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order #${currentOrder?.orderId.toString()}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ...currentOrder.cartItems.map((item) => ODItemCard(item)),
                  if (currentOrder.specialRequest != '')
                    buildODSpecialRequest(currentOrder.specialRequest!),
                  if (currentOrder.packageString != '')
                    buildODPackaging(currentOrder.packageString!),
                  if (currentOrder.vouchers.length != 0)
                    buildVoucherDisplay(currentOrder.vouchers),
                  //address
                  if (currentOrder.deliveryAddress != '')
                    buildODAddress(currentOrder.deliveryAddress!, currentOrder.onSitePickup!),
                  if (currentOrder.phoneNumber != '')
                    buildODPhone(currentOrder.phoneNumber!),
                  if (currentOrder.paymentMethod != '')
                    buildODPaymentMethod(currentOrder.paymentMethod!),
                  buildODPaymentDetails(currentOrder),
                ]
              )
            ),
            buildTotalPriceDisplay(currentOrder.totalPrice!),
          ]
      ),
    );
  }
}

Widget placeholder(OrderOB? currentOrder) => Center(
    child: Text(
      '',
      style: TextStyle(fontSize: 24),
    )
);








