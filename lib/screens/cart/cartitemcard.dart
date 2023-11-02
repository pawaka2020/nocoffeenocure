import 'package:flutter/material.dart';

String lorem = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris. 
Nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate. 
Velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non. 
Proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
""";

class CartItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Container(
        width: double.infinity,
        height: 125,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Stack(
              children: [
                // Your card content here
                Container(
                  width: 80, // Adjust the width as needed
                  height: double.infinity,
                  child: Image.asset(
                    'assets/images/coffeesample.png', // Provide the image path
                    fit: BoxFit.cover,
                  ),
                ),
                // Content in the remaining space
                Padding(
                  padding: EdgeInsets.only(left: 90, top: 8, right: 16, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Monster Milkshake",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          lorem,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Qty: 3",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                // Edit text at the bottom right corner
                Positioned(
                  bottom: 8, // Adjust the position as needed
                  right: 16, // Adjust the position as needed
                  child: GestureDetector(
                    onTap: () {
                      // Implement edit functionality
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

                // Delete text at the bottom right corner
                Positioned(
                  bottom: 8, // Adjust the position as needed
                  right: 70, // Adjust the position as needed
                  child: GestureDetector(
                    onTap: () {
                      // Implement delete functionality
                    },
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}