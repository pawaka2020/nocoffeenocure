import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:nocoffeenocure/widgets/top_banner.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home/home.dart';
import 'menu.dart';
import 'package:nocoffeenocure/screens/me/me.dart';

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

//Display [news] items
// Column bannermenu = Column(
//   children: [
//     Expanded(
//         flex: 3,
//         child: TopBanner()
//     ),
//     Expanded(
//         flex: 7,
//         child: MenuWidget()
//     )
//   ],
// );

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Current selected tab index
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          HomePage(), // Default page shown on app launch
          VouchersPage(), // Vouchers page
          CartPage(), // Cart page
          TrackPage(),
          Me()
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      //bottom nav bar, using a custom library instead of Flutter's default
      //only 'track' and 'cart' are coded, others will be coded later.
      bottomNavigationBar:buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      backgroundColor: Colors.white, // Set the background color
      onItemSelected: (int index) {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        });
      },
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home', style: TextStyle(color: Colors.black)), // Set text color
          activeColor: Colors.orange, // Set active tab text color
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.local_offer),
          title: Text('Vouchers', style: TextStyle(color: Colors.black)), // Set text color
          activeColor: Colors.orange, // Set active tab text color
          textAlign: TextAlign.center,
        ),
        cart,
        track,
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Me', style: TextStyle(color: Colors.black)), // Set text color
          activeColor: Colors.orange, // Set active tab text color
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class VouchersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Vouchers Page'),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cart Page'),
    );
  }
}

class TrackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Track Page'),
    );
  }
}