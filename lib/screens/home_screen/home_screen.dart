import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:nocoffeenocure/screens/home_screen/top_banner.dart';
import 'package:nocoffeenocure/screens/home_screen/tracknavybaritem.dart';
import '../../common.dart';
import '../../main.dart';
import '../../models/cartitem.dart';
import '../../repos/cartitem.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../cart/cart_screen.dart';
import '../menu/menu.dart';
import 'package:nocoffeenocure/screens/me/me.dart';
import '../news/newspage.dart';
import '../order/order_screen.dart';
import 'cartnavybaritem.dart';

/*
The screen that users will mainly see.
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

  /*
  Used inside MenuPage
  meant to be used inside placeOrder
  : updates cart count
  */
  void updateCartCount(int adjustment) {
    setState(() {
      _cartCount = _cartCount + adjustment;
      if (_cartCount < 0) _cartCount = 0;
    });
  }

  /*
  Used inside MenuPage
  meant to be used inside placeOrder
  :
  */
  Future<void> placeOrder(int length) async {
    _tracking = true;
    await changePage(3);
    updateCartCount(length * -1);
    CartItemRepo().flushUserCartItems();
    printToast("Order placed");
  }

  /*
  Used in TrackScreen
  :
  */
  void setTracking(bool value, int pageIndex) async {
    setState(() {
      _tracking = value;

    });
    await changePage(pageIndex);
  }

  /*
  Used inside MeScreen
  :
  */
  void adjustCartCountTracking() {
    setState(() {
      _cartCount = singletonUser.cartItems.length;
      if (singletonUser.orders.length != 0) _tracking = true;
      else _tracking = false;
    });
  }

  /*
  Used inside bottomNavigationBar
  :
  */
  Future<void> changePage(int index) async {
    await _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 1),
      curve: Curves.ease,
    );
  }

  @override
  void initState() {
    super.initState();
    adjustCartCountTracking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          MenuPage(updateCartCount),
          NewsPage(),
          CartScreen(updateCartCount, placeOrder, _tracking),
          TrackScreen(_tracking, setTracking),
          MeScreen(adjustCartCountTracking),
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

/*

*/
Widget buildBottomNavigationBar(int currentIndex, int cartCount, bool tracking,
    Future<void> Function(int) changePage) {
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
        icon: Icon(Icons.newspaper),
        title: Text('News', style: TextStyle(color: Colors.black)), // Set text color
        activeColor: Colors.orange, // Set active tab text color
        textAlign: TextAlign.center,
      ),
      buildCartNavyBarItem(cartCount),
      buildOrderNavyBarItem(tracking),
      BottomNavyBarItem(
        icon: Icon(Icons.person),
        title: Text('Me', style: TextStyle(color: Colors.black)), // Set text color
        activeColor: Colors.orange, // Set active tab text color
        textAlign: TextAlign.center,
      ),
    ],
  );
}

// Future<void> removeOrder(int length) async {
//   _tracking = false;
//   await changePage(0);
// }
