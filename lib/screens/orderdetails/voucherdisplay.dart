import 'package:flutter/material.dart';
import '../../models/order.dart';
import '../../models/voucher.dart';
import '../../widgets/partial_divider.dart';

Widget buildVoucherDisplay(List<VoucherOB> vouchers) {
  return Column(
      children: [
        PartialDivider(40, 10),
        Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Vouchers",
                  ),
                ),
                SizedBox(height: 5),
                ...vouchers.map((item) {
                  return Column(
                    children: [
                      buildVoucherCard(item),
                      SizedBox(height: 10),
                    ]
                  );
                }),
              ],
            )
        )
      ]
  );
}

Widget buildVoucherCard(VoucherOB voucher) {
  return Container(
    height: 80,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                      voucher.image!,
                      fit: BoxFit.fitWidth,
                      height: double.infinity,
                      width:double.infinity
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.all(16),
                //   child: Icon(),
                // ),
              ]
          )
      ),
    )
  );
}

Widget buildSelectedVoucherCard(VoucherOB voucher, BuildContext context,
    List<int> selectedVoucherIds, void Function(int) removeVoucher) {
  return Container(
      height: 80, //70
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () {
            //
            removeVoucher(voucher.id);
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
                child: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      )
  );
}