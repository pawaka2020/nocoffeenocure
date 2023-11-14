import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';

Widget buildPaymentDetails(Price price, BuildContext context) {

  //state functions
  return Padding(
    padding: EdgeInsets.only(left: 32, right: 32, top: 0, bottom: 8),
    child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Payment details")
          ),
          buildDivider(),
          detailsRow("Amount (Incl. 6% SST)", 'RM ${price.amount.toStringAsFixed(2)}'),
          detailsRow("Vouchers", '- RM ${price.voucherDeduction.toStringAsFixed(2)}'),
          detailsRow("Subtotal", 'RM ${price.subtotal.toStringAsFixed(2)}'),
          detailsRowInfo("Delivery fee", "RM ${price.deliveryFee.toStringAsFixed(2)}", "Delivery fee", "Loren ipsum", context),
        ]
    ),
  );
}

Widget buildDivider() {
  return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Divider(
          height: 7,
          color: Colors.grey
      )
  );
}

Widget detailsRow(String text1, String text2) {
  return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                text1,
                style: TextStyle(
                    fontSize: 12
                )
            ),
            Text(
                text2,
                style: TextStyle(
                    fontSize: 12
                )
            )
          ]
      )
  );
}

Widget detailsRowInfo(String text1, String text2, String infoTitle, String infoText, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(width: 5), // Add spacing between text and icon
            InkWell(
              onTap: () {
                // Show a pop-up dialog with 'infoText' when the icon is tapped
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(infoTitle),
                      content: Text(infoText),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.info, size: 16, color: Colors.blue),
            ),
          ],
        ),
        Text(
          text2,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}