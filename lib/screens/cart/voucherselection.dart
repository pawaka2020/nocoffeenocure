import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/selectunusedvoucher/selectunusedvoucher.dart';

import '../../models/voucher.dart';

// class VoucherSelection extends StatefulWidget {
//   @override
//   _VoucherSelectionState createState() => _VoucherSelectionState();
// }
//
// class _VoucherSelectionState extends State<VoucherSelection> {
//   bool _hasSelectedVoucher = false; // Tracks whether a voucher has been selected
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Vouchers",
//             ),
//             SizedBox(height: 5),
//             // _hasSelectedVoucher ? SelectedVoucherCard() : buildEmptyVoucherCard(),
//             buildSelectedVoucherCard(),
//             SizedBox(height: 10),
//             buildSelectedVoucherCard(),
//             SizedBox(height: 10),
//             //buildEmptyVoucherCard(context),
//           ],
//         )
//     );
//   }
// }

Widget buildVoucherSelection(
    List<int> selectedVoucherIds, List<VoucherOB> vouchers,
    BuildContext context, void Function(List<int> _selectedVoucherIds) func){
  return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vouchers",
          ),
          SizedBox(height: 5),
          // buildSelectedVoucherCard(),
          // SizedBox(height: 10),
          // buildSelectedVoucherCard(),
          //SizedBox(height: 10),
          buildEmptyVoucherCard(context, vouchers, selectedVoucherIds, func),
        ],
      )
  );
}

// class AddVoucherCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       child: InkWell(
//         onTap: () {
//           // Navigate to the screen to select a voucher
//         },
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Add Voucher",
//                 style: TextStyle(
//                   fontSize: 12,
//                 ),
//               ),
//               Icon(Icons.add),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AddVoucherCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 80, //70
//         child: Card(
//           elevation: 4,
//           child: InkWell(
//             onTap: () {
//               // Navigate to the screen to select a voucher
//             },
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Add Voucher",
//                     style: TextStyle(
//                       fontSize: 12,
//                     ),
//                   ),
//                   Icon(Icons.add),
//                 ],
//               ),
//             ),
//           ),
//         )
//     );
//   }
// }

Widget buildEmptyVoucherCard(
    BuildContext context, List<VoucherOB> vouchers,
    List<int> selectedVoucherIds, void Function(List<int> _selectedVoucherIds) func) {
  return Container(
      height: 80, //70
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () async {
            final _selectedVoucherIds = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SelectUnusedVoucherScreen(vouchers, selectedVoucherIds, context),
            ));
            //updateSelectedVoucherId(_selectedVoucherIds)
            //setstate()
            func(_selectedVoucherIds);
            //func([1, 2, 3]);
            //test();
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
  );
}

void test() {
  print("Testing2");
}



Widget buildSelectedVoucherCard() {
  return Container(
      height: 80, //70
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () {
            // Navigate to the screen to select a voucher
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Image.asset(
                  "assets/images/vouchertest1.png",
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
//
// class SelectedVoucherCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Selected Voucher",
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             // Display the details of the selected voucher here
//           ],
//         ),
//       ),
//     );
//   }
// }