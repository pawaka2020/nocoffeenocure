import 'package:flutter/material.dart';

import '../../common.dart';
import '../../models/voucher.dart';
import '../../repos/voucher.dart';

class SelectUnusedVoucherScreen extends StatelessWidget {
  List<VoucherOB> vouchers;
  List<int> selectedVoucherIds;
  BuildContext context;

  SelectUnusedVoucherScreen(this.vouchers, this.selectedVoucherIds, this.context);

  @override
  Widget build(BuildContext context) {

    List<VoucherOB> unusedList = VoucherRepo()
        .getNotFromIdList(vouchers, selectedVoucherIds);

    // printToast("sadasdsadsadsadsadasdsadasdsadasdasdasdasdasdasdsadsad");

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Select Voucher',
            style: TextStyle(
              color: Colors.white,
            )
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: ListView(
          children: [
            SizedBox(height: 5),
            ...unusedList.map((item) {
              return Column(
                  children: [
                    buildSelectVoucherCard(item, context, selectedVoucherIds),
                    SizedBox(height: 10),
                  ]
              );
            }),
          ]
        )
      )
    );
  }
}

Widget buildSelectVoucherCard(VoucherOB voucher, BuildContext context, List<int> selectedVoucherIds) {
  return Container(
      height: 80, //70
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: InkWell(
            onTap: () {
              // Navigate to the screen to select a voucher
              SelectVoucher(context, voucher, selectedVoucherIds);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Image.asset(
                    voucher.image!,
                    fit: BoxFit.fill,
                    height: double.infinity
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        )
      )
  );
}

void SelectVoucher(BuildContext context, VoucherOB voucher, List<int> selectedVoucherIds) {
  print("Voucher selected");
  print("Voucher id = ${voucher.id.toString()}");
  selectedVoucherIds.add(voucher.id);
  Navigator.of(context).pop(true);
}

Center placeholder = Center(
    child: Text(
      'Help me!',
      style: TextStyle(fontSize: 24),
    )
);