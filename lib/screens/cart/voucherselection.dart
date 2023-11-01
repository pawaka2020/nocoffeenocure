import 'package:flutter/material.dart';

class VoucherSelection extends StatefulWidget {
  @override
  _VoucherSelectionState createState() => _VoucherSelectionState();
}

class _VoucherSelectionState extends State<VoucherSelection> {
  bool _hasSelectedVoucher = false; // Tracks whether a voucher has been selected

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vouchers",
            // style: TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
          SizedBox(height: 5),
          _hasSelectedVoucher ? SelectedVoucherCard() : AddVoucherCard(),
        ],
      )
    );

  }
}

class AddVoucherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          // Navigate to the screen to select a voucher
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add Voucher",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Icon(Icons.add),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectedVoucherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Selected Voucher",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            // Display the details of the selected voucher here
          ],
        ),
      ),
    );
  }
}