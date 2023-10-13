import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../menu.dart';

class HomePage extends StatelessWidget {

  final List<MenuItem> menuItems = [
    MenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino1', 'RM 5.00'),
    MenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino2', 'RM 5.00'),
    MenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino3', 'RM 5.00'),
    MenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino4', 'RM 5.00'),
    MenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino5', 'RM 5.00'),
    MenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino6', 'RM 5.00'),
    MenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino7', 'RM 5.00'),
    // Add more menu items here
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(30.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio:150/250,
        crossAxisCount : 2,
      ),
      itemCount: menuItems.length,
      itemBuilder: (ctx, index) {
        return MenuCard(menuItems[index]);
      },
    );
  }
}

//this one is usable
class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250, //290
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/coffeesample.png',
                width: 150,
                height: 165,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5),
              Container(
                width: 150,
                height: 25,
                alignment: Alignment.center,
                child: Text(
                  'Sweet Cappuccino',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Divider(),
              Container(
                width: 150,
                height: 25,
                alignment: Alignment.center,
                child: Text(
                  'RM 5.00',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//uses three parameter
class MyCard2 extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  MyCard2(this.imagePath, this.title, this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250, //290
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Column(
            children: [
              Image.asset(
                imagePath, // Use the provided image path
                width: 150,
                height: 165,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5),
              Container(
                width: 150,
                height: 25,
                alignment: Alignment.center,
                child: Text(
                  title, // Use the provided title
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Divider(),
              Container(
                width: 150,
                height: 25,
                alignment: Alignment.center,
                child: Text(
                  price, // Use the provided price
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String imagePath;
  final String title;
  final String price;

  MenuItem(this.imagePath, this.title, this.price);
}

//we use this one. A widget that accepts a data class
class MenuCard extends StatelessWidget {
  final MenuItem menuItem;

  MenuCard(this.menuItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250, //290
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Column(
            children: [
              Image.asset(
                menuItem.imagePath,
                width: 150,
                height: 165,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5),
              Container(
                width: 150,
                height: 25,
                alignment: Alignment.center,
                child: Text(
                  menuItem.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Divider(),
              Container(
                width: 150,
                height: 25,
                alignment: Alignment.center,
                child: Text(
                  menuItem.price,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Empty extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      child: Card(
        color: Colors.grey
      )
    );
  }
}