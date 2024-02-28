import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common.dart';
import '../../main.dart';
import '../../models/cartitem.dart';
import '../../models/menuitem.dart';
import '../../provider/cart_count_notifier.dart';
import '../../repos/cartitem.dart';
import '../../repos/menuitem.dart';
import '../../repos/user.dart';
import '../../widgets/partial_divider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../menu/menu.dart';
import 'dart:io';

/*stateful widget version*/
//load data from repos here.
class MenuDetailsPage extends StatefulWidget {
  final MenuItem menuItem;
  final bool editMode;
  final int quantity;
  final int cartItemId;
  void Function(int) updateCartCount;
  MenuDetailsPage(this.menuItem, this.editMode, this.quantity, this.cartItemId, this.updateCartCount);

  @override
  _MenuDetailsPageState createState() => _MenuDetailsPageState();
}

class _MenuDetailsPageState extends State<MenuDetailsPage> {
  late double price;
  late double basePrice;
  late int quantity;

  void adjustPrice() {
    setState(() {
      price = widget.menuItem.price;
      for (var addition in widget.menuItem.additions) {
        price += addition.selectedPrice;
      }
      basePrice = price;
      price = basePrice * quantity;
    });
  }

  void increaseQuantity() {
    setState(() {
      quantity = quantity + 1;
      price = basePrice * quantity;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity = quantity - 1;
        price = basePrice * quantity;
      }
    });
  }

  void addToCart() {
    //create object
    CartItemOB newcart = CartItemOB()
      ..quantity = quantity
      ..price = price
      ..menuItemOB.add(widget.menuItem.toMenuItemOB()) //this one
    ;
    //write it to objectbox
    CartItemRepo().put(newcart);
    printToast("Item added to cart");
    //
    widget.updateCartCount(1);
    Navigator.of(context).pop();
  }

  void updateCart() {
    CartItemOB updatedCartItem = CartItemRepo().box.get(widget.cartItemId);
    updatedCartItem.menuItemOB[0] = widget.menuItem.toMenuItemOB();
    updatedCartItem.quantity = quantity;
    updatedCartItem.price = price;

    Navigator.of(context).pop(updatedCartItem);
  }

  @override
  void initState() {
    super.initState();

    price = widget.menuItem.price;
    basePrice = price;
    quantity = widget.quantity;
    adjustPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.menuItem.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 30),
                MenuImage(widget.menuItem.imagePath),
                SizedBox(height: 15),
                Description(widget.menuItem.description),
                SizedBox(height: 15),
                PartialDivider(32, 10),
                Reviews(widget.menuItem.userReviews),
                PartialDivider(32, 10),
                SizedBox(height: 5),
                Column(
                  children: widget.menuItem.additions.map((addition) {
                    return AdditionMenu(addition, adjustPrice); // Pass adjustPrice function
                  }).toList(),
                ),
                // Add any other content you want in the scrolling area
              ],
            ),
          ),
          Finalize(price, quantity, decreaseQuantity, increaseQuantity, addToCart, updateCart, widget.editMode), // Step 3: Pass the adjusted price to Finalize
        ],
      ),
    );
  }
}

class MenuImage extends StatelessWidget {
  final String imagePath;

  MenuImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,   //default 200 //300
        height: 310,  //default 333 //310
        //child: Image.asset(imagePath)
        child: Image.file(
          File(imagePath),
          width: 50, //150
          height: 55,//165
          //fit: BoxFit.cover,
        )
    );

    // return SizedBox(
    //   width: 150,
    //   child: Card(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(12.0),
    //     ),
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.circular(12.0),
    //       child: Image.file(
    //         File(imagePath),
    //         width: 150,
    //         height: 200, //230
    //       ),
    //     ),
    //   ),
    // );
  }
}

class Description extends StatelessWidget {
  final String description;

  Description(this.description);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Text(
        description,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class Reviews extends StatelessWidget {
  final List<UserReview> userReviews;

  Reviews(this.userReviews);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0), // Add horizontal padding
      child: Container(
        height: 80.0, //80
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: userReviews.length,
          itemBuilder: (context, index) {
            if (index > 0) {
              // Add a vertical divider to the left of the second review onward
              return Row(
                children: [
                  Container(
                    width: 1.0, // Width of the vertical divider
                    color: Colors.black12, // Color of the vertical divider
                  ),
                  ReviewCard(userReviews[index]),
                ],
              );
            }
            else {
              return ReviewCard(userReviews[index]);
            }
          },
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final UserReview review;
  ReviewCard(this.review);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.41, //0.5 if full length of phone
          padding: EdgeInsets.all(8.0), // Add padding here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stars(review.stars),
              Name(review.name),
              Expanded(
                child: SingleChildScrollView( // Use a SingleChildScrollView to allow scrolling if text is too large
                  child: Message(review.message),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Stars extends StatelessWidget {
  final int stars;
  final double starSize;

  Stars(this.stars, {this.starSize = 12.0});

  @override
  Widget build(BuildContext context) {
    List<Widget> starIcons = [];
    for (int i = 0; i < 5; i++) {
      if (i < stars) {
        starIcons.add(Icon(Icons.star, color: Colors.yellow, size: starSize));
      }
      else {
        starIcons.add(Icon(Icons.star_border, color: Colors.grey, size: starSize));
      }
    }
    return Row(
      children: starIcons,
    );
  }
}

class Name extends StatelessWidget {
  final String name;

  Name(this.name);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "$name",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  final String text;

  Message(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '"$text"',
          style: TextStyle(
            fontSize: 10,
            fontStyle: FontStyle.italic,
          ),
        )
    );
  }
}

class AdditionMenu extends StatefulWidget {
  final Addition addition;
  final Function() adjustPrice;
  AdditionMenu(this.addition, this.adjustPrice);

  @override
  _AdditionMenuState createState() => _AdditionMenuState();
}

class _AdditionMenuState extends State<AdditionMenu> {
  late int selectedDetailIndex;

  @override
  Widget build(BuildContext context) {
    //selectedDetailIndex = 1; //0
    selectedDetailIndex = widget.addition.selectedIndex;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.addition.title),
          ),
        ),
        Column(
          children: widget.addition.additionDetails
              .asMap()
              .entries
              .map((entry) {
            final index = entry.key;
            final additionDetail = entry.value;
            return AdditionMenuDetail(
              additionDetail,
              isSelected: index == selectedDetailIndex,
              onTap: () {
                //change here.
                setState(() {
                  widget.addition.selectedPrice = additionDetail.price;
                  selectedDetailIndex = index;
                  //new change.
                  widget.addition.selectedIndex = selectedDetailIndex;
                  //print(widget.addition.title + " index " + widget.addition.selectedIndex.toString() + " selected");
                  //widget.adjustPrice(additionDetail);
                  widget.adjustPrice();
                });
              },
            );
          }).toList(),
        ),
        PartialDivider(32, 20),
      ],
    );
  }
}

/*only reacts when icon is tapped, not the whole widget*/
class AdditionMenuDetail extends StatelessWidget {
  final AdditionDetail additionDetail;
  final bool isSelected;
  final VoidCallback onTap;

  AdditionMenuDetail(this.additionDetail, {required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    String priceDisplay;
    if (additionDetail.price != 0) priceDisplay = '+ RM ${additionDetail.price.toStringAsFixed(2)}';
    else priceDisplay = "";
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? Colors.blue : Colors.grey,
              size: 18,
            ),
            onPressed: onTap,
          ),
          SizedBox(width: 8),
          Text(
            additionDetail.name,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Spacer(),
          Text(
            priceDisplay,
            style: TextStyle(
              fontSize: 12,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Finalize extends StatelessWidget {
  final double price;
  final int quantity;
  final VoidCallback decreaseQuantity;
  final VoidCallback increaseQuantity;
  final void Function() addToCart;
  final void Function() updateCart;

  final bool editMode;
  Finalize(this.price, this.quantity, this.decreaseQuantity, this.increaseQuantity,
      this.addToCart, this.updateCart, this.editMode);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width, // Set the width to the screen's width
      child: Card(
          elevation: 4,
          margin: EdgeInsets.all(0),
          child: Padding(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuantityDisplay(price, quantity, decreaseQuantity, increaseQuantity),
                  editMode
                      ? AddToCartButton(context, updateCart, "Update")
                      : AddToCartButton(context, addToCart, "Add To Cart")
                ],
              ),
            ),
          )
      ),
    );
  }
}

class QuantityDisplay extends StatelessWidget {
  final double price;
  final int quantity;// Pass the adjusted price as a parameter
  final VoidCallback decreaseQuantity;
  final VoidCallback increaseQuantity;
  QuantityDisplay(this.price, this.quantity, this.decreaseQuantity, this.increaseQuantity);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\RM ${price.toStringAsFixed(2)}', // Display the adjusted price here
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                //print("button remove pressed");
                decreaseQuantity();
              }
            ),
            Text(
              quantity.toString(),
              style: TextStyle(fontSize: 16),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                //print("button add pressed");
                increaseQuantity();
                // decreaseFactor();
              } // Call the onIncrease function when the button is pressed
            ),
          ]
        )
      ],
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final BuildContext context;
  final void Function() func;
  final String buttonLabel;
  AddToCartButton(this.context, this.func, this.buttonLabel);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        func();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange, ///Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded button edges
        ),
      ),
      child: Container(
        width: double.infinity, // Occupy the maximum available width
        child: Center(
          child: Text(
            buttonLabel,
            style: TextStyle(
              color: Colors.white, // Text color
              fontSize: 16, // Text size
            ),
          ),
        ),
      ),
    );
  }
}

