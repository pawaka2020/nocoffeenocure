import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/cart/packaging.dart';
import 'package:nocoffeenocure/screens/cart/paymentmethods.dart';
import 'package:nocoffeenocure/screens/cart/specialrequest.dart';
import 'package:nocoffeenocure/screens/cart/voucherselection.dart';

import '../../widgets/partial_divider.dart';
import 'cartitemcard.dart';
import 'ordersubmit.dart';
//TODO: maybe change CartScreen to a stateless widget.

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool empty = false;

  @override
  Widget build(BuildContext context) {
    if (empty == false)
      return CartDisplay();
    else return placeholder2;
  }
}

class CartDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CartDisplayState();
}

class _CartDisplayState extends State<CartDisplay> {
  double _finalPrice = 10.00;
  String _specialRequest = '';

  void adjustPrice() {
    setState(() {
      _finalPrice += 20.00;
    });
  }

  void updateSpecialRequest(String newText) {
    setState(() {
      _specialRequest = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    CartItemCard(),
                    CartItemCard(),
                    CartItemCard(),
                    CartItemCard(),
                    CartItemCard(),
                    CartItemCard(),
                    CartItemCard(),
                    CartItemCard(),
                    PartialDivider(40, 10),
                    SpecialRequest(
                      specialRequest: _specialRequest,
                      onSpecialRequestChanged: updateSpecialRequest,
                    ),
                    PartialDivider(40, 10),//special requests (textfield)
                    Packaging(),
                    PartialDivider(40, 10),//packaging (need straws, need paper bag, etc)
                    PaymentMethods(),
                    PartialDivider(40, 10),
                    VoucherSelection(),
                    SizedBox(height: 5),//payment methods (wallet (topup), e-wallet, credit card, online banking)
                    //vouchers (buttons to add voucher)
                    //payment details
                    //grand total
                  ],
                ),
              ),
              OrderSubmit(_finalPrice, adjustPrice)
            ]
        )
    );


  }
}

Center placeholder = Center(
    child: Text(
      'Cart page',
      style: TextStyle(fontSize: 24),
    )
);

Center placeholder2 = Center(
    child: Text(
      'Cart is empty',
      style: TextStyle(fontSize: 24),
    )
);