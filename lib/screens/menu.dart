import 'package:flutter/material.dart';

import 'home/home.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //buildCoffeeCategory(),
      ],
    );
    //return CategoryGrids();
  }

  // Widget buildCoffeeCategory() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Padding(
  //         padding: EdgeInsets.only(
  //           left: 26,
  //           //top: 14,
  //         ), // Add padding around the 'Coffee' text
  //         child: Text(
  //           'Coffee',
  //           style: TextStyle(
  //             //fontWeight: FontWeight.bold,
  //             fontStyle: FontStyle.italic,
  //             fontSize: 24, // Adjust the font size as needed
  //           ),
  //         ),
  //       ),
  //       GridView.builder(
  //         shrinkWrap: true,
  //         physics: NeverScrollableScrollPhysics(),
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2, // Number of columns
  //         ),
  //         itemCount: 4, // Number of items in the grid
  //         itemBuilder: (context, index) {
  //           //return buildMenuItem('Latte', '5 USD', 'assets/images/tiny.png');
  //           return CappuccinoCard();
  //         },
  //       ),
  //     ],
  //   );
  // }

  Widget buildMenuItem(String itemName, String itemPrice, String imagePath) {
    return Column(
      children: [
        Image.asset(
          imagePath, // Replace with the path to your item's image.
          width: 120, // Adjust the width as needed.
          height: 120, // Adjust the height as needed.
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(itemName, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(itemPrice),
          ],
        ),
      ],
    );
  }

  Widget buildNonCoffeeCategory() {
    return ExpansionTile(
      title: Text('Non Coffee'),
      children: [
        ListTile(
          leading: Checkbox(
            value: false, // Replace with your checkbox logic.
            onChanged: (bool? value) {
              // Handle checkbox state change.
            },
          ),
          title: Text('Tea'),
          trailing: Text('4 USD'),
        ),
        // Add more menu items here.
      ],
    );
  }

  Widget buildSnacksCategory() {
    return ExpansionTile(
      title: Text('Snacks'),
      children: [
        ListTile(
          leading: Checkbox(
            value: false, // Replace with your checkbox logic.
            onChanged: (bool? value) {
              // Handle checkbox state change.
            },
          ),
          title: Text('Muffin'),
          trailing: Text('2 USD'),
        ),
        // Add more menu items here.
      ],
    );
  }
// Add more category functions as needed.
}

///new widgets

