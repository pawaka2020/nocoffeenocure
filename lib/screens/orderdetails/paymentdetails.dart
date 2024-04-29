import 'package:flutter/material.dart';
import '../../models/order.dart';
import '../../widgets/partial_divider.dart';
import '../cart/cart_screen.dart';
import '../cart/paymentdetails.dart';

Widget buildODPaymentDetails(OrderOB currentOrder) {
  String display = '';
  return Column(
      children: [
        PartialDivider(40, 10),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Payment Details")
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 32, right: 32, top: 0, bottom: 8),
          child: Column(
            children: [
              detailsRow("Amount (Incl. 6% SST)", 'RM ${currentOrder.amount?.toStringAsFixed(2)}'),
              detailsRow("Vouchers", '- RM ${currentOrder.voucherDeduction?.toStringAsFixed(2)}'),
              detailsRow("Subtotal", 'RM ${currentOrder.subtotal?.toStringAsFixed(2)}'),
              detailsRow("Delivery fee",'RM ${currentOrder.deliveryFee?.toStringAsFixed(2)}'),
              if (currentOrder.appWalletDiscount != 0) detailsRow("NCNC Wallet Discount", '- RM ${currentOrder.appWalletDiscount?.toStringAsFixed(2)}'),
            ]
          )
        )
      ]
  );
}

