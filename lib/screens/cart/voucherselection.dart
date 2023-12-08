import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/selectunusedvoucher/selectunusedvoucher.dart';
import '../../models/voucher.dart';
import '../../repos/voucher.dart';

Widget buildVoucherSelection(List<VoucherOB> usedList, List<int> selectedVoucherIds,
    List<VoucherOB> vouchers, BuildContext context, void Function() addVoucher, void Function(int) removeVoucher) {

  return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vouchers",
          ),
          SizedBox(height: 5),
          ...usedList.map((item) {
            return Column(
                children: [
                  buildSelectedVoucherCard(item, context, selectedVoucherIds, removeVoucher),
                  SizedBox(height: 10),
                ]
            );
          }),
          buildEmptyVoucherCard(context, vouchers, selectedVoucherIds, addVoucher),
        ],
      )
  );
}

Widget buildEmptyVoucherCard(BuildContext context, List<VoucherOB> vouchers,
    List<int> selectedVoucherIds, void Function() addVoucher) {
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
            onTap: () async {
              addVoucher();
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Voucher",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Icon(Icons.add),
              ],
            ),
            ),
          ),
        )
      )
  );
}

Widget buildSelectedVoucherCard(VoucherOB voucher, BuildContext context,
    List<int> selectedVoucherIds, void Function(int) removeVoucher) {
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
                      height: double.infinity,
                      width: double.infinity
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      )
  );
}