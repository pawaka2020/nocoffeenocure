import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/menu_detail.dart';
import '../../widgets/selection_bar.dart';
import '../../widgets/top_banner.dart';

// class HomePage extends StatelessWidget {
//   final List<MyMenuItem> myMenuItems = [
//     MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino1', 'RM 5.00', 'Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino2', 'RM 5.00', 'Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino3', 'RM 5.00', 'Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Juice4', 'RM 5.00', 'Non-Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Juice5', 'RM 5.00', 'Non-Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Juice6', 'RM 5.00', 'Non-Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Juice7', 'RM 5.00', 'Non-Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino4', 'RM 5.00', 'Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino5', 'RM 5.00', 'Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino6', 'RM 5.00', 'Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Juice1', 'RM 5.00', 'Non-Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Juice2', 'RM 5.00', 'Non-Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Juice3', 'RM 5.00', 'Non-Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino7', 'RM 5.00', 'Coffee'),
//     MyMenuItem('assets/images/coffeesample.png', 'Best Juice Ever', 'RM 5.00', 'Non-Coffee'),
//   ];
//   final List<String> categories = [
//     'All',
//     'Coffee',
//     'Non-Coffee'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     //logic implementation for 'SelectionBar'
//     String selectedCategory = 'All';
//
//     return Column(
//       children:[
//         TopBanner(),
//         SelectionBar(categories),
//         MenuGrid(myMenuItems),
//       ],
//     );
//   }
// }

class HomePage extends StatefulWidget {
  final List<MyMenuItem> myMenuItems = [
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino1', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino2', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino3', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice4', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice5', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice6', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice7', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino4', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino5', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino6', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice1', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice2', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice3', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino7', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Best Juice Ever', 'RM 5.00', 'Non-Coffee'),
  ];

  final List<String> categories = [
    'All', // Add more categories as needed
    'Coffee',
    'Non-Coffee',
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';
  ScrollController scrollController = ScrollController();

  void handleCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
      double offset = 0.0;
      for (final category in widget.categories) {
        if (category == selectedCategory) break;
        offset += getSliverListHeight(widget.myMenuItems, category);
      }
      scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  double getSliverListHeight(List<MyMenuItem> menuItems, String category) {
    final items = menuItems.where((item) => item.category == category).toList();
    final itemCount = items.length;
    final rows = (itemCount / 2).ceil(); // 2 items per row
    return 10.0 + 10.0 + (rows * 250.0) + (rows - 1) * 10.0; // Padding + title + cards + spacing
  }

  @override
  Widget build(BuildContext context) {
    final List<MyMenuItem> filteredMenuItems = selectedCategory == 'All'
        ? widget.myMenuItems
        : widget.myMenuItems.where((item) => item.category == selectedCategory).toList();

    return Column(
      children: [
        TopBanner(),
        SelectionBar2(widget.categories, handleCategorySelected),
        MenuGrid(filteredMenuItems, scrollController), // Pass the controller
      ],
    );
  }
}

class MyMenuItem {
  final String imagePath;
  final String title;
  final String price;
  final String category;

  MyMenuItem(this.imagePath, this.title, this.price, this.category);
}

class MyMenuCard extends StatelessWidget {
  final MyMenuItem myMenuItem;

  MyMenuCard(this.myMenuItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,   //default 150
      height: 250,  //default 250
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Column(
            children: [
              Image.asset(
                myMenuItem.imagePath,
                width: 150,
                height: 165,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5), //default 5
              Container(
                width: 150,
                height: 25,
                alignment: Alignment.center,
                child: Text(
                  myMenuItem.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Divider(),
              Container(
                width: 150,
                height: 25,
                alignment: Alignment.center,
                child: Text(
                  myMenuItem.price,
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
  final List<MyMenuItem> menuItems;
  final ScrollController scrollController;

  //MenuGrid(this.menuItems);
  MenuGrid(this.menuItems, this.scrollController);

  SliverToBoxAdapter buildGridTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 30.0, top: 10.0, bottom: 10.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SliverGrid buildGrid(List<MyMenuItem> menuItems) {
    return SliverGrid(
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
            child: MyMenuCard(menuItem),
          );
        },
        childCount: menuItems.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Group the menu items by category
    final Map<String, List<MyMenuItem>> menuItemsByCategory = {};

    for (final menuItem in menuItems) {
      if (!menuItemsByCategory.containsKey(menuItem.category)) {
        menuItemsByCategory[menuItem.category] = [];
      }
      menuItemsByCategory[menuItem.category]?.add(menuItem);
    }
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: CustomScrollView(
          slivers: [
            for (final category in menuItemsByCategory.keys)
              [
                buildGridTitle(category),
                buildGrid(menuItemsByCategory[category]!),
              ],
          ].expand((element) => element).toList(),
        ),
      ),
    );
  }
}

// Simulate fetching promotions from a backend (replace with actual API call)
Future<List<MyMenuItem>> fetchMenuItemsDummy() async {
  await Future.delayed(Duration(seconds: 2));
  return [
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino1', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino2', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino3', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice4', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice5', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice6', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice7', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino4', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino5', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino6', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice1', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice2', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Juice3', 'RM 5.00', 'Non-Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Sweet Cappuccino7', 'RM 5.00', 'Coffee'),
    MyMenuItem('assets/images/coffeesample.png', 'Best Juice Ever', 'RM 5.00', 'Non-Coffee'),
    // Add more promotions as needed
  ];
}

//async capability
class MenuGrid2 extends StatelessWidget {
  SliverToBoxAdapter buildGridTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 30.0, top: 10.0, bottom: 10.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SliverGrid buildGrid(List<MyMenuItem> menuItems) {
    return SliverGrid(
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
            child: MyMenuCard(menuItem),
          );
        },
        childCount: menuItems.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: FutureBuilder<List<MyMenuItem>>(
          future: fetchMenuItemsDummy(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // Handle error
                return Text("Error: ${snapshot.error}");
              }
              final menuItems = snapshot.data;
              // Group the menu items by category
              final Map<String, List<MyMenuItem>> menuItemsByCategory = {};

              for (final menuItem in menuItems!) {
                if (!menuItemsByCategory.containsKey(menuItem.category)) {
                  menuItemsByCategory[menuItem.category] = [];
                }
                menuItemsByCategory[menuItem.category]?.add(menuItem);
              }
              return CustomScrollView(
                slivers: [
                  for (final category in menuItemsByCategory.keys)
                    [
                      buildGridTitle(category),
                      buildGrid(menuItemsByCategory[category]!),
                    ],
                ].expand((element) => element).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class CategorySelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Adjust the width as needed
      color: Colors.grey, // Set your desired background color
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Handle Coffee selection
              // You can use Navigator or any other navigation method here
            },
            child: Icon(Icons.coffee, size: 40, color: Colors.black), // Replace with your coffee icon
          ),
          GestureDetector(
            onTap: () {
              // Handle Non-coffee selection
              // You can use Navigator or any other navigation method here
            },
            child: Icon(Icons.local_drink, size: 40, color: Colors.black), // Replace with your non-coffee icon
          ),
        ],
      ),
    );
  }
}

class MenuGrid3 extends StatelessWidget {
  final List<MyMenuItem> menuItems;

  MenuGrid3(this.menuItems);

  SliverToBoxAdapter buildGridTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 30.0, top: 10.0, bottom: 10.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SliverGrid buildGrid(List<MyMenuItem> menuItems) {
    return SliverGrid(
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
            child: MyMenuCard(menuItem),
          );
        },
        childCount: menuItems.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Group the menu items by category
    final Map<String, List<MyMenuItem>> menuItemsByCategory = {};

    for (final menuItem in menuItems) {
      if (!menuItemsByCategory.containsKey(menuItem.category)) {
        menuItemsByCategory[menuItem.category] = [];
      }
      menuItemsByCategory[menuItem.category]?.add(menuItem);
    }
    return Container(
      height: 500,
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: CustomScrollView(
          slivers: [
            for (final category in menuItemsByCategory.keys)
              [
                buildGridTitle(category),
                buildGrid(menuItemsByCategory[category]!),
              ],
          ].expand((element) => element).toList(),
        ),
      ),
    );
  }
}
