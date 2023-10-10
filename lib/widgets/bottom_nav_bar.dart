import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

BottomNavyBarItem buildNavyBarItem(IconData icondata, String title){
  return BottomNavyBarItem(
    icon: Icon(icondata),
    title: Text(title, style: TextStyle(color:Colors.white)),
    activeColor: Colors.white,
    textAlign: TextAlign.center,
  );
}

//icon changed.
//integrate with 'Consumer' widget later.
BottomNavyBarItem cart = BottomNavyBarItem(
  icon: Stack(
    children: [
      Icon(Icons.shopping_cart), //the icon
      Positioned(
        //right: 0,
        left: 12,
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red, // Set the background color of the badge
          ),
          child: CircleAvatar(
            radius: 4, // Adjust the size of the badge, default 10
            backgroundColor: Colors.transparent,
            child: Text(
              '3', // Replace with the actual number of items in the cart
              style: TextStyle(
                fontSize: 8,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ), //'number'
        ),
      ), //the badge
    ],
  ),
  title: Text('Cart', style: TextStyle(color: Colors.white)),
  activeColor: Colors.white,
  textAlign: TextAlign.center,
);

//also integrate with 'Consumer' widget later.
BottomNavyBarItem track = BottomNavyBarItem(
  icon: Stack(
    children: [
      Icon(Icons.directions_bike), //the icon
      Positioned(
        left: 12,
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: CircleAvatar(
            radius: 4,
            backgroundColor: Colors.transparent,
            child: Text(
              '!',
              style: TextStyle(
                fontSize:8, //default 10
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ), //'number'
        ),
      ), //the badge
    ],
  ),
  title: Text('Track', style: TextStyle(color: Colors.white)),
  activeColor: Colors.white,
  textAlign: TextAlign.center,
);


class ShoppingCartCountNotifier extends ChangeNotifier {
  int _count = 0;

  int get count => _count;
  void addToCart() {
    _count++;
    notifyListeners();
  }
  void removeFromCart() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }
}

//as an example of how to include Consumer into a widget for later
class ShoppingCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartCountNotifier>(
      builder: (context, countNotifier, child) {
        return Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Handle cart button press
              },
            ),
            if (countNotifier.count > 0)
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red, // Set the background color of the badge
                  ),
                  child: CircleAvatar(
                    radius: 10, // Adjust the size of the badge
                    backgroundColor: Colors.transparent,
                    child: Text(
                      countNotifier.count.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}