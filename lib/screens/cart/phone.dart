import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// class DeliveryAddress extends StatefulWidget {
//   @override
//   _DeliveryAddressState createState() => _DeliveryAddressState();
// }
//
// class _DeliveryAddressState extends State<DeliveryAddress> {
//   String _address = ''; // Store the user's address
//   bool _onSitePickup = false; // Toggle for on-site pickup
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 16, right: 28, top: 8, bottom: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Delivery Address"),
//           SizedBox(height: 10),
//           Row(
//             children: [
//               InkWell(
//                 onTap: () {
//                   // Implement logic to get user's current location address
//                   // and update the _address field
//                 },
//                 child: Icon(
//                     Icons.location_on,
//                     color: Colors.blue,
//                     size: 32
//                 ),
//               ),
//               SizedBox(width: 10),
//               Expanded(
//                   child: TextField(
//                     //onChanged: onSpecialRequestChanged,
//                     style: TextStyle(
//                         fontSize: 12,
//                         color:Colors.blue
//                     ),
//                     decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                         ),
//                         hintText: 'E.g. I need more ice.',
//                         hintStyle: TextStyle(fontSize: 10) // Temporary placeholder text
//                     ),
//                   )
//               ),
//             ],
//           ),
//           buildSelectionRow(_onSitePickup, (bool? value) {
//             setState(() {
//               if (value != null) {
//                 _onSitePickup = value;
//               }
//             });
//           }),
//         ],
//       ),
//     );
//   }
//
//   Row buildSelectionRow(bool selected, ValueChanged<bool?> onChanged) {
//     return Row(
//       mainAxisAlignment:MainAxisAlignment.end,
//       children: [
//         Checkbox(
//           value: selected,
//           onChanged: onChanged,
//         ),
//         Text(
//           "On-site pickup",
//           style: TextStyle(
//             fontSize: 12,
//           ),
//         ),
//         Spacer(),
//       ],
//     );
//   }
// }

Widget buildPhoneNumber(Function(String) onSpecialRequestChanged) {
  String phoneNumber = '';
  return Padding(
    padding: EdgeInsets.only(left: 16, right: 28, top: 8, bottom: 8),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Phone number"),
          SizedBox(height: 10),
          TextField(
            onChanged: onSpecialRequestChanged,
            style: TextStyle(
                fontSize: 12,
                color:Colors.blue
            ),
            keyboardType: TextInputType.number, //phone, number
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              // Add any additional formatters if needed
            ],
            maxLength: 11,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: 'Eg. 60193446789',
                hintStyle: TextStyle(fontSize: 10) // Temporary placeholder text
            ),
          )
        ]
    ),
  );
}