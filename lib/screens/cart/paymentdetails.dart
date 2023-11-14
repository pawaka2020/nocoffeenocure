import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';

Widget buildPaymentDetails(Price price, double amount, double voucherDeduction, BuildContext context) {
  double tax = 0.06;
  double deliveryFee = 4.00;

  //state functions
  double getTax(double amount, double tax) {
    return (amount * tax);
  }

  double getSubTotal() {
    return (amount + getTax(amount, tax) - voucherDeduction);
  }

  int getPoints() {
    return 5;
  }

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
          //detailsRow("SST (${(tax * 100).toStringAsFixed(0)}%)", 'RM ${getTax(price.amount, tax).toStringAsFixed(2)}'),
          detailsRow("Vouchers", '- RM ${voucherDeduction.toStringAsFixed(2)}'),
          detailsRow("Subtotal", 'RM ${getSubTotal().toStringAsFixed(2)}'),
          detailsRowInfo("Delivery fee", "RM ${deliveryFee.toStringAsFixed(2)}", "Delivery fee", "Loren ipsum", context),
          //detailsRow("Rounding adjustment", 'RM ${0.00.toStringAsFixed(2)}'),
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