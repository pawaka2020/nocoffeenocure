import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SizedBox buildTotalPriceDisplay(double finalPrice) {
  return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 14,
        margin: EdgeInsets.all(0),
        child: Padding(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: Container(
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text('\RM ${finalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ]
                ),
            )
        ),
      )
  );
}