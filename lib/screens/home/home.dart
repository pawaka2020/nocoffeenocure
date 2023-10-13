import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../menu.dart';
import '../menu_detail.dart';

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
  final List<MenuItem> menuItems2 = [
    MenuItem('assets/images/coffeesample.png', 'Juice1', 'RM 5.00'),
    MenuItem('assets/images/coffeesample.png', 'Juice2', 'RM 5.00'),
    MenuItem('assets/images/coffeesample.png', 'Juice3', 'RM 5.00'),
    MenuItem('assets/images/coffeesample.png', 'Juice4', 'RM 5.00'),
    MenuItem('assets/images/coffeesample.png', 'Juice5', 'RM 5.00'),
    MenuItem('assets/images/coffeesample.png', 'Juice6', 'RM 5.00'),
    MenuItem('assets/images/coffeesample.png', 'Juice7', 'RM 5.00'),
    // Add more menu items here
  ];

  // @override
  // Widget build(BuildContext context) {
  //   return GridView.builder(
  //     padding: EdgeInsets.all(30.0),
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       childAspectRatio:150/250,
  //       crossAxisCount : 2,
  //     ),
  //     itemCount: menuItems.length,
  //     itemBuilder: (ctx, index) {
  //       return MenuCard(menuItems[index]);
  //     },
  //   );
  //}

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.only(top: 10.0, left: 30.0, bottom: 10.0), // Add padding above and to the left of the text
  //         child: Text(
  //           "Coffee items",
  //           style: TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //       Expanded(
  //         child: Padding(
  //           padding: EdgeInsets.only(left: 30, right: 30), // Apply padding to the grid
  //           child: CustomScrollView(
  //             slivers: <Widget>[
  //               SliverGrid(
  //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                   childAspectRatio: 150 / 250,
  //                   crossAxisCount: 2,
  //                 ),
  //                 delegate: SliverChildBuilderDelegate(
  //                       (BuildContext context, int index) {
  //                     return MenuCard(menuItems[index]);
  //                   },
  //                   childCount: menuItems.length,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  @override
  Widget build(BuildContext context) {
      //return MenuGrid3(menuItems);
    return Column(
      children:[
        SizedBox(height: 25),
        MenuGrid4(menuItems, menuItems2),
      ]
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

class MenuGrid extends StatelessWidget {
  final List<MenuItem> menuItems;

  MenuGrid(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 30.0, bottom: 10.0),
          child: Text(
            "Coffee items",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 150 / 250,
                    crossAxisCount: 2,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return MenuCard(menuItems[index]);
                    },
                    childCount: menuItems.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MenuGrid2 extends StatelessWidget {
  final List<MenuItem> menuItems;

  MenuGrid2(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
            child: Text(
              "Coffee items",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 150 / 250,
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return MenuCard(menuItems[index]);
            },
            childCount: menuItems.length,
          ),
        ),
      ],
    );
  }
}

class MenuGrid3 extends StatelessWidget {
  final List<MenuItem> menuItems;

  MenuGrid3(this.menuItems);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child:CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 30.0, top: 10.0, bottom: 10.0),
                child: Text(
                  "Coffee items",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 150 / 250,
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return MenuCard(menuItems[index]);
                },
                childCount: menuItems.length,
              ),
            ),
          ],
        )
      ),
    );
  }
}

class MenuGrid4 extends StatelessWidget {
  final List<MenuItem> menuItems;
  final List<MenuItem> menuItems2;
  MenuGrid4(this.menuItems, this.menuItems2);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child:CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 30.0, top: 10.0, bottom: 10.0),
                  child: Text(
                    "Coffee items",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 150 / 250,
                  crossAxisCount: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return MenuCard(menuItems[index]);
                      },
                  childCount: menuItems.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 30.0, top: 10.0, bottom: 10.0),
                  child: Text(
                    "Non-Coffee items",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 150 / 250,
                  crossAxisCount: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return MenuCard(menuItems2[index]);
                      },
                  childCount: menuItems2.length,
                ),
              ),
            ],
          )
      ),
    );
  }
}

class MenuGrid5 extends StatelessWidget {
  final List<MenuItem> menuItems;
  final List<MenuItem> menuItems2;

  MenuGrid5(this.menuItems, this.menuItems2);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: CustomScrollView(
          slivers: [
            // ... Existing Slivers ...

            // Wrap MenuCard with GestureDetector
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 150 / 250,
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  final menuItem = menuItems[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MenuDetailsPage(menuItem),
                        ),
                      );
                    },
                    child: MenuCard(menuItem),
                  );
                },
                childCount: menuItems.length,
              ),
            ),

            // ... Non-Coffee items ...

            // Wrap MenuCard with GestureDetector for non-coffee items
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 150 / 250,
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  final menuItem = menuItems2[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MenuDetailsPage(menuItem),
                        ),
                      );
                    },
                    child: MenuCard(menuItem),
                  );
                },
                childCount: menuItems2.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
