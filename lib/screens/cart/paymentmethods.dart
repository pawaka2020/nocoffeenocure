import 'package:flutter/material.dart';

//TODO: replace PaymentMethods UI with cards later.
//TODO: cards lead user to another screen, then after finishing details, the card shows tick sign.
class PaymentMethods extends StatefulWidget {
  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  String _selectedPaymentMethod = 'Company Wallet';

  final List<PaymentMethod> paymentMethods = [
    PaymentMethod('E-wallet',  Icons.account_balance_wallet),
    PaymentMethod('Credit card',  Icons.credit_card),
    PaymentMethod('Online banking',  Icons.account_balance),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Methods",
          ),
          buildCompanyWallet(),
          Column(
            children:
            paymentMethods.map((method) {
              return buildPaymentMethodRow(method);
            }).toList(),

          ),
        ],
      )
    );
  }

  Row buildCompanyWallet() {
    return Row(
      children: [
        Radio<String>(
          activeColor:Colors.blue,
          value: "NCNC Wallet",
          groupValue: _selectedPaymentMethod,
          onChanged: (String? value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
        Text(
            "NCNC Wallet (20% off!)",
            style: TextStyle(
                fontSize: 12
            )
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {  },
          child: Text(
              "+Top Up",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white
              )
          ),
        ),
      ],
    );
  }

  Widget buildPaymentMethodRow(PaymentMethod method) {
    return Row(
      children: [
        Radio<String>(
          activeColor:Colors.blue,
          value: method.name,
          groupValue: _selectedPaymentMethod,
          onChanged: (String? value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
        Text(
            method.name,
            style: TextStyle(
              fontSize: 12
            )
        ),
        Spacer(),
        Icon(
          method.icon,
          size: 24,
          color: Colors.blue
        ),
      ],
    );
  }
}

class PaymentMethod {
  final String name;
  final IconData icon;

  PaymentMethod(this.name, this.icon);
}
