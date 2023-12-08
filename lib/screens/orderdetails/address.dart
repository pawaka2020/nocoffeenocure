import 'package:flutter/material.dart';
import '../../models/order.dart';
import '../../widgets/partial_divider.dart';

Widget buildODAddress(String deliveryAddress, bool onSitePickup) {
  String display = '';
  if (onSitePickup == true)
    display += '(Local pickup) ';
  display += deliveryAddress;

  return Column(
      children: [
        PartialDivider(40, 10),
        Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Address",
              ),
            ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 32, right: 32, top: 0, bottom: 8),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                display,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                ),
              )
          )
        )
      ]
  );
}