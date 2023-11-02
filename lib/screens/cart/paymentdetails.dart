import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PaymentDetailsState();

}

class _PaymentDetailsState extends State<PaymentDetails> {
  //state variables
  double _amount = 10.00;
  double _tax = 0.06;
  double _voucherDeduction = 3.45;

  //state functions
  double getTax(double _amount, double _tax)
  {
    return (_amount * _tax);
  }

  double getSubTotal() {
    return (_amount + getTax(_amount, _tax) - _voucherDeduction);
  }

  int getPoints() {
    return 5;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 32, right: 32, top: 0, bottom: 8),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Payment details")
          ),
          buildDivider(),
          detailsRow("Amount", 'RM ${_amount.toStringAsFixed(2)}'),
          detailsRow("SST (${(_tax * 100).toStringAsFixed(0)}%)", 'RM ${getTax(_amount, _tax).toStringAsFixed(2)}'),
          detailsRow("Vouchers", '- RM ${_voucherDeduction.toStringAsFixed(2)}'),
          detailsRow("Subtotal", 'RM ${getSubTotal().toStringAsFixed(2)}'),
          detailsRowInfo("Delivery fee", "RM 4.00", "Delivery fee", "Loren ipsum"),
          detailsRow("Rounding adj", 'RM ${0.00.toStringAsFixed(2)}'),
          // buildDivider(),
          // grandTotalRow(),
          // detailsRow("NCNC points earned", '${getPoints().toString()} pts')
        ]
      ),
    );
  }

  Padding buildDivider() {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Divider(
          height: 7,
          color: Colors.grey
      )
    );
  }

  Padding detailsRow(String text1, String text2) {
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

  Padding detailsRowInfo(String text1, String text2, String infoTitle, String infoText) {
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

  Padding grandTotalRow(){
    double grandTotal = _amount;
    return Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Grand Total",
                  style: TextStyle(
                      fontSize: 16
                  )
              ),
              Text(
                  'RM ${grandTotal.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 16
                  )
              )
            ]
        )
    );
  }

}