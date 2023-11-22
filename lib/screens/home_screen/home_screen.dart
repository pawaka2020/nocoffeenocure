import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:nocoffeenocure/screens/home_screen/top_banner.dart';
import 'package:nocoffeenocure/screens/home_screen/tracknavybaritem.dart';
import '../../common.dart';
import '../../models/cartitem.dart';
import '../../repos/cartitem.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../cart/cart_screen.dart';
import '../menu/menu.dart';
import 'package:nocoffeenocure/screens/me/me.dart';

import '../track/trackpage.dart';
import 'cartnavybaritem.dart';

/*
Main screen of app.
This app has 3 main components:
1 - A banner at the top to show [news] items in a auto rotation.
2 - Menu items at the middle.
3 - Bottom navigation bar.
*/
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _cartCount = 0;
  bool _tracking = false;
  PageController _pageController = PageController(initialPage: 0);

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 1), //default 300
        curve: Curves.ease,
      );
    });
  }

  void updateCartCount(int adjustment) {
    setState(() {
      _cartCount = _cartCount + adjustment;
      if (_cartCount < 0) _cartCount = 0;
    });
  }

  void setTracking() {
    //add OrderItem
    _tracking = true;
    printToast("Order placed");
    changePage(0);
    // if (_tracking == false) {
    //   setState(() {
    //
    //   });
    // }
    // else {
    //   printToast("Error: existing order already present");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          MenuPage(updateCartCount), //put updateCartCount here
          VouchersPage(),
          CartScreen(updateCartCount, setTracking, changePage, _tracking), //put updateCartCount here
          TrackPage(),
          Me()
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: buildBottomNavigationBar(_currentIndex, _cartCount, _tracking, changePage),
    );
  }
}

Widget buildBottomNavigationBar(int currentIndex, int cartCount, bool tracking, void Function(int) changePage) {
  return BottomNavyBar(
    selectedIndex: currentIndex,
    backgroundColor: Colors.white, // Set the background color
    onItemSelected: (int index) {
      changePage(index);
    },
    items: [
      BottomNavyBarItem(
        icon: Icon(Icons.restaurant_menu),
        title: Text('Menu', style: TextStyle(color: Colors.black)), // Set text color
        activeColor: Colors.orange, // Set active tab text color
        textAlign: TextAlign.center,
      ),
      BottomNavyBarItem(
        icon: Icon(Icons.local_offer),
        title: Text('Vouchers', style: TextStyle(color: Colors.black)), // Set text color
        activeColor: Colors.orange, // Set active tab text color
        textAlign: TextAlign.center,
      ),
      buildCartNavyBarItem(cartCount),
      buildTrackNavyBarItem(tracking),
      BottomNavyBarItem(
        icon: Icon(Icons.person),
        title: Text('Me', style: TextStyle(color: Colors.black)), // Set text color
        activeColor: Colors.orange, // Set active tab text color
        textAlign: TextAlign.center,
      ),
    ],
  );
}

class VouchersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Vouchers Page'),
    );
  }
}

