import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_nav_bar.dart';

// class ShoppingCartWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ShoppingCartCountNotifier>(
//       builder: (context, countNotifier, child) {//hhjh
//         return Stack(
//           children: [
//             IconButton(
//               icon: Icon(Icons.shopping_cart),
//               onPressed: () {
//                 // Handle cart button press
//               },//
//             ),
//             if (countNotifier.count > 0)
//               Positioned(
//                 right: 0,
//                 child: Container(
//                   padding: EdgeInsets.all(2),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.red, // Set the background color of the badge
//                   ),
//                   child: CircleAvatar(
//                     radius: 10, // Adjust the size of the badge
//                     backgroundColor: Colors.transparent,
//                     child: Text(
//                       countNotifier.count.toString(),
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }