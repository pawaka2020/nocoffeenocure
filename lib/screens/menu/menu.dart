import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/menu_detail/menu_detail.dart';
import '../../models/menuitem.dart';
import '../../repos/menuitem.dart';
import '../../widgets/partial_divider.dart';
import '../home_screen/selection_bar.dart';
import '../home_screen/top_banner.dart';
import 'dart:io';
//line 157 for navigation
//load the repos here.
class MenuPage extends StatefulWidget {
  void Function(int) updateCartCount;
  MenuPage(this.updateCartCount);

  var menuItems = MenuItemRepo().getAll();

  List<String> get categories {
    List<String> uniqueCategories = menuItems.map((item) => item.category).toSet().toList();
    return uniqueCategories;
  }

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //String selectedCategory = 'All';
  late String selectedCategory;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Set the initial category to the first one in the list
    selectedCategory = (widget.categories.isNotEmpty ? widget.categories[0] : null)!;
  }

  void handleCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
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
        MenuGrid(filteredMenuItems, scrollController, widget.updateCartCount), // Pass the controller
      ],
    );
  }
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
              // Image.asset(
              //   menuItem.imagePath,
              //   width: 150,
              //   height: 165,//165
              //   fit: BoxFit.cover,
              // ),
              Image.file(
                File(menuItem.imagePath),
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
  void Function(int) updateCartCount;

  MenuGrid(this.menuItems, this.scrollController, this.updateCartCount);

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
                  builder: (context) => MenuDetailsPage(menuItem, false, 1, 0, updateCartCount),
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