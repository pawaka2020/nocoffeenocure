import 'package:flutter/material.dart';

import '../../models/cartitem.dart';
import '../../models/menuitem.dart';

String lorem = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris. 
Nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate. 
Velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non. 
Proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
""";

class CartItemCard extends StatelessWidget {
  CartItemOB cartItem;
  final void Function(BuildContext, int) deleteCallback;
  final void Function(BuildContext, int) editCallback;

  CartItemCard(this.cartItem, this.deleteCallback, this.editCallback);

  String getContent(List<AdditionOB> additions) {

    final List<String> contentList = [];
    for (var addition in additions) {
      contentList.add(
          addition.title! + ': ' + addition.additionDetails[addition.selectedIndex!].name!
      );
    }
    final String content = contentList.join(', ');
    return content;
  }

  @override
  Widget build(BuildContext context) {

    String image = cartItem.menuItemOB[0].imagePath!;
    String name = cartItem.menuItemOB[0].title!;
    String content = getContent(cartItem.menuItemOB[0].additions);

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Container(
        width: double.infinity,
        height: 125,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Stack(
              children: [
                Container(
                  width: 80, // Adjust the width as needed
                  height: double.infinity,
                  child: Image.asset(
                    //cartItem.image!,
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 90, top: 8, right: 16, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //cartItem.name!,
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          //cartItem.content!,
                          content,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Qty: ${cartItem.quantity}",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "Price: RM${cartItem.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 8, // Adjust the position as needed
                  right: 16, // Adjust the position as needed
                  child: InkWell(
                    onTap: () {
                      editCallback(context, cartItem.id);
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ), //edit
                Positioned(
                  bottom: 8, // Adjust the position as needed
                  right: 70, // Adjust the position as needed
                  child: InkWell(
                    onTap: () {
                      deleteCallback(context, cartItem.id);
                    },
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ), //delete
              ],
            ),
          ),
        ),
      ),
    );
  }




}