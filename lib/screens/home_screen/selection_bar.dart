import 'package:flutter/material.dart';


class SelectionBar extends StatelessWidget {
  final List<String> categories;
  final Function(String) onCategorySelected; // Callback function

  SelectionBar(this.categories, this.onCategorySelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (String category in categories)
              GestureDetector(
                onTap: () {
                  // Call the callback function to notify the parent widget of the category selection
                  onCategorySelected(category);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Customize the color
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
