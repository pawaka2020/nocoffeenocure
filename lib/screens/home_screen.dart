import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:nocoffeenocure/widgets/top_banner.dart';
import '../widgets/placeholder_block.dart';
import 'menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Current selected tab index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: TopBanner()
          ),
          Expanded(
            flex: 7,
            child: MenuWidget()
          )
        ],
      ),// Show the selected tab content
      bottomNavigationBar: buildBottomNavigationBar(0), // Call the function
    );
  }

  // Function to build the BottomNavyBar
  Widget buildBottomNavigationBar(int currentIndex) {
    return BottomNavyBar(
      selectedIndex: currentIndex,
      backgroundColor: Colors.orange, // Set the background color
      onItemSelected: (int index) {
        // Handle tab selection
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home', style: TextStyle(color: Colors.white)), // Set text color
          activeColor: Colors.white, // Set active tab text color
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.local_offer),
          title: Text('Vouchers', style: TextStyle(color: Colors.white)), // Set text color
          activeColor: Colors.white, // Set active tab text color
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.shopping_cart), // Change the icon to a shopping cart icon.
          title: Text('Cart', style: TextStyle(color: Colors.white)), // Set text color
          activeColor: Colors.white, // Set active tab text color
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Me', style: TextStyle(color: Colors.white)), // Set text color
          activeColor: Colors.white, // Set active tab text color
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

}