import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nocoffeenocure/dummy_screen.dart';
import 'package:nocoffeenocure/screens/menu_detail.dart';
import '../../repos/dummy/menuitem.dart';
//import '../../repos/menuitem.dart';
import '../../repos/menuitem.dart';
import '../../widgets/partial_divider.dart';
import '../../widgets/selection_bar.dart';
import '../../widgets/top_banner.dart';

final List<MenuItem> menuItemDummy2 = [
  MenuItem(
      'assets/images/coffeesample.png',
      'I DONT SLEEP',
      10.00,
      'Coffee',
      'A rich and bold blend that promises to keep you wide awake and invigorated. '
          'Crafted from premium, handpicked coffee beans, this dark roast boasts '
          'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
      [
        UserReview("Richard", "Powerful!", 5),
        UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
      ],
      [
        Addition(
            "Beans",
            [
              AdditionDetail("Supremo", 0.00),
              AdditionDetail("Yirgacheffe", 5.30),
              AdditionDetail("Mandheling", 8.00)
            ]
        ),
        Addition(
            "Sweetness",
            [
              AdditionDetail("Less sugar", 0),
              AdditionDetail("More sugar", 1.00),
            ]
        ),
      ],
      [
        Ingredient("Supremo", "assets/image/tiny.png"),
        Ingredient("Lemon", "assets/image/tiny.png"),
        Ingredient("Soda lemon", "assets/image/tiny.png"),
      ],
      true
  ),
  MenuItem(
      'assets/images/coffeesample.png',
      'Huhu lala',
      10.00,
      'Coffee',
      'A rich and bold blend that promises to keep you wide awake and invigorated. '
          'Crafted from premium, handpicked coffee beans, this dark roast boasts '
          'a robust flavor with deep, earthy undertones and a subtle hint of cocoa. '
          'asdadads asdsads asdadsa as sadad asdsad as sads as as dsa as dsa sada'
          'sadsadsadas sad saasdsadas as sadsad as sad a as dsa as dasa.',
      [
        UserReview("Richard", "Powerful!", 5),
        UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4),
        UserReview("Betty Mania", loren, 4)
      ],
      [
        Addition(
            "Beans",
            [
              AdditionDetail("Supremo", 0.00),
              AdditionDetail("Yirgacheffe", 5.30),
              AdditionDetail("Mandheling", 8.00)
            ]
        ),
        Addition(
            "Sweetness",
            [
              AdditionDetail("Less sugar", 0),
              AdditionDetail("More sugar", 1.00),
            ]
        ),
        Addition(
            "Cup size",
            [
              AdditionDetail("Normal", 0),
              AdditionDetail("Large", 3.00),
              AdditionDetail("Deluxe", 10.00),
            ]
        ),
      ],
      [
        Ingredient("Supremo", "assets/image/tiny.png"),
        Ingredient("Lemon", "assets/image/tiny.png"),
        Ingredient("Soda lemon", "assets/image/tiny.png"),
      ],
      true
  ),
  MenuItem(
      'assets/images/coffeesample.png',
      'I DONT SLEEP3',
      10.00,
      'Coffee',
      'A rich and bold blend that promises to keep you wide awake and invigorated. '
          'Crafted from premium, handpicked coffee beans, this dark roast boasts '
          'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
      [
        UserReview("Richard", "Powerful!", 5),
        UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
      ],
      [
        Addition(
            "Beans",
            [
              AdditionDetail("Supremo", 0.00),
              AdditionDetail("Yirgacheffe", 5.30),
              AdditionDetail("Mandheling", 8.00)
            ]
        ),
        Addition(
            "Sweetness",
            [
              AdditionDetail("Less sugar", 0),
              AdditionDetail("More sugar", 1.00),
            ]
        ),
      ],
      [
        Ingredient("Supremo", "assets/image/tiny.png"),
        Ingredient("Lemon", "assets/image/tiny.png"),
        Ingredient("Soda lemon", "assets/image/tiny.png"),
      ],
      true
  ),
  MenuItem(
      'assets/images/coffeesample.png',
      'I DONT SLEEP4',

      10.00,
      'Coffee',
      'A rich and bold blend that promises to keep you wide awake and invigorated. '
          'Crafted from premium, handpicked coffee beans, this dark roast boasts '
          'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
      [
        UserReview("Richard", "Powerful!", 5),
        UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
      ],
      [
        Addition(
            "Beans",
            [
              AdditionDetail("Supremo", 0.00),
              AdditionDetail("Yirgacheffe", 5.30),
              AdditionDetail("Mandheling", 8.00)
            ]
        ),
        Addition(
            "Sweetness",
            [
              AdditionDetail("Less sugar", 0),
              AdditionDetail("More sugar", 1.00),
            ]
        ),
      ],
      [
        Ingredient("Supremo", "assets/image/tiny.png"),
        Ingredient("Lemon", "assets/image/tiny.png"),
        Ingredient("Soda lemon", "assets/image/tiny.png"),
      ],
      true
  ),
  MenuItem(
      'assets/images/coffeesample.png',
      'I DONT SLEEP',

      10.00,
      'Non-Coffee',
      'A rich and bold blend that promises to keep you wide awake and invigorated. '
          'Crafted from premium, handpicked coffee beans, this dark roast boasts '
          'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
      [
        UserReview("Richard", "Powerful!", 5),
        UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
      ],
      [
        Addition(
            "Beans",
            [
              AdditionDetail("Supremo", 0.00),
              AdditionDetail("Yirgacheffe", 5.30),
              AdditionDetail("Mandheling", 8.00)
            ]
        ),
        Addition(
            "Sweetness",
            [
              AdditionDetail("Less sugar", 0),
              AdditionDetail("More sugar", 1.00),
            ]
        ),
      ],
      [
        Ingredient("Supremo", "assets/image/tiny.png"),
        Ingredient("Lemon", "assets/image/tiny.png"),
        Ingredient("Soda lemon", "assets/image/tiny.png"),
      ],
      true
  ),
];

List<MenuItem> testSerialize(){
  final menuItems = menuItemDummy2;
  final serializedMenuItems = menuItemDummy2.map((menuItem) => menuItem.toJson()).toList();
  final deserializedMenuItems = serializedMenuItems.map((json) => MenuItem.fromJson(json)).toList();
  return deserializedMenuItems;
  //serialize menuItems to a map
  //deserialize that map back to 'menuItems'
}


class HomePage extends StatefulWidget   {

  //List<MenuItem> menuItems = menuItemDummy;
  var menuItems = testSerialize();
  //var menuItems2 = testSerialize();//set data source here.

  List<String> get categories {
    List<String> uniqueCategories = menuItems.map((item) => item.category).toSet().toList();
    uniqueCategories.insert(0, 'All');
    return uniqueCategories;
  }

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
        offset += getSliverListHeight(widget.menuItems, category);
      }
      scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  double getSliverListHeight(List<MenuItem> menuItems, String category) {
    final items = menuItems.where((item) => item.category == category).toList();
    final itemCount = items.length;
    final rows = (itemCount / 2).ceil(); // 2 items per row
    return 10.0 + 10.0 + (rows * 250.0) + (rows - 1) * 10.0; // Padding + title + cards + spacing
  }

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> filteredMenuItems = selectedCategory == 'All'
        ? widget.menuItems
        : widget.menuItems.where((item) => item.category == selectedCategory).toList();

    return Column(
      children: [
        TopBanner(),
        SelectionBar(widget.categories, handleCategorySelected),
        PartialDivider(32, 2),
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

//here

class MenuItem2 {
  final String imagePath;
  final String title;
  final String price;
  final double _price2;
  final String category;
  final String description;
  final List<UserReview> userReviews;
  final List<Addition> additions;
  final List<Ingredient> ingredients;
  final bool available;

  MenuItem2(this.imagePath, this.title, this.price, this._price2, this.category,
      this.description,this.userReviews, this.additions, this.ingredients,
      this.available);
}

class MyMenuCard extends StatelessWidget {
  
  
  final MenuItem menuItem;

  MyMenuCard(this.menuItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,   //default 150
      height: 230,  //default 250 //works 230 //height 200
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
                height: 165,//165
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5), //default 5
              Container(
                width: 150,
                height: 15, //25
                alignment: Alignment.center,
                child: Text(
                  menuItem.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Divider(),
              Container(
                width: 150,
                height: 15, //25
                alignment: Alignment.center,
                child: Text(
                  'RM ${menuItem.price.toStringAsFixed(2)}',
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
  final ScrollController scrollController;

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

  SliverGrid buildGrid(List<MenuItem> menuItems) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 150 / 230, //150/250, 150/230
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
                  //builder: (context) => DummyScreen()
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
    final Map<String, List<MenuItem>> menuItemsByCategory = {};

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