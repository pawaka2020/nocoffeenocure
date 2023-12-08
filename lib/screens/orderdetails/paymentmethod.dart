import 'package:flutter/material.dart';
import '../../models/order.dart';
import '../../widgets/partial_divider.dart';

Widget buildODPaymentMethod(String? paymentMethod) {
  String display = paymentMethod!;
  return Column(
      children: [
        PartialDivider(40, 10),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Payment Method",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 32, right: 32, top: 0, bottom: 8),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                display,
                style: TextStyle(
                  fontSize: 12,
                ),
              )
          )
        )
      ]
  );
}