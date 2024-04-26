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
            Icon(Icons.arrow_back_ios, color: Colors.blue),
            for (String category in categories)
              GestureDetector(
                onTap: () {
                  onCategorySelected(category);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 16, //16
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Customize the color
                    ),
                  ),
                ),
              ),
            Icon(Icons.arrow_forward_ios, color: Colors.blue)
          ]
        )
      ),
    );
  }
}
