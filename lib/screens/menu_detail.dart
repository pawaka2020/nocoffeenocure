import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../repos/menuitem.dart';
import '../widgets/partial_divider.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*stateful widget version*/
class MenuDetailsPage extends StatefulWidget {
  final MenuItem menuItem;

  MenuDetailsPage(this.menuItem);

  @override
  _MenuDetailsPageState createState() => _MenuDetailsPageState();
}

class _MenuDetailsPageState extends State<MenuDetailsPage> {
  late double price;
  late double basePrice;
  int factor = 1;

  @override
  void initState() {
    super.initState();
    price = widget.menuItem.price;
    basePrice = price;
  }

  void adjustPrice(AdditionDetail selectedDetail) {
    setState(() {
      price = widget.menuItem.price;
      for (var addition in widget.menuItem.additions){
        price += addition.selectedPrice;
      }
      basePrice = price;
      price = basePrice * factor;
    });
  }

  void increaseFactor() {
    setState(() {
      factor = factor + 1;
      price = basePrice * factor;
    });
  }

  void decreaseFactor() {
    setState(() {
      if (factor > 1){
        factor = factor - 1;
        price = basePrice * factor;
      }
    });
  }

  void addToCart() {}

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
                SizedBox(height: 15),
                MenuImage(widget.menuItem.imagePath),
                SizedBox(height: 15),
                Description(widget.menuItem.description),
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
          Finalize(price, factor, decreaseFactor, increaseFactor, addToCart), // Step 3: Pass the adjusted price to Finalize
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
        width: 300,   //default 200
        height: 310,  //default 333
        child: Image.asset(imagePath)
    );
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
            } else {
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
              Message(review.message),
            ],
          ),
        ),
      ],
    );
  }
}

class Stars extends StatelessWidget {
  final int stars;
  final double starSize; // Add a parameter for the star size

  Stars(this.stars, {this.starSize = 12.0}); // Default size is 24.0

  @override
  Widget build(BuildContext context) {
    List<Widget> starIcons = [];
    for (int i = 0; i < 5; i++) {
      if (i < stars) {
        // Filled star icon with a specified size
        starIcons.add(Icon(Icons.star, color: Colors.yellow, size: starSize));
      } else {
        // Empty star icon with a specified size
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
          fontSize: 10, // Adjust the font size as needed
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
            fontSize: 10, // Adjust the font size as needed
            fontStyle: FontStyle.italic, // Italicize the text
          ),
        )
    );
  }
}

/*before adding price adjustment feature*/
class AdditionMenu extends StatefulWidget {
  final Addition addition;
  final Function(AdditionDetail) adjustPrice;
  AdditionMenu(this.addition, this.adjustPrice);

  @override
  _AdditionMenuState createState() => _AdditionMenuState();
}

class _AdditionMenuState extends State<AdditionMenu> {
  int selectedDetailIndex = 0; // Set the first detail as the default

  @override
  Widget build(BuildContext context) {
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
                setState(() {
                  widget.addition.selectedPrice = additionDetail.price;
                  selectedDetailIndex = index;
                  widget.adjustPrice(additionDetail);
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



/*after adding price adjustment feature*/


/*
Rm 9.00 (-) 2 (+)
Add to Card
*/
class Finalize extends StatelessWidget {
  final double price;
  final int factor;// Pass the adjusted price as a parameter
  final VoidCallback decreaseFactor;
  final VoidCallback increaseFactor;
  final VoidCallback addToCart;

  Finalize(this.price, this.factor, this.decreaseFactor, this.increaseFactor,
      this.addToCart);
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
                  QuantityDisplay(price, factor, decreaseFactor, increaseFactor),
                  AddToCartButton(addToCart),
                ],
              ),
            ),
          )
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final VoidCallback addToCart;
  AddToCartButton(this.addToCart);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        addToCart();
        // Add your action when the button is pressed
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.orange, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded button edges
        ),
      ),
      child: Container(
        width: double.infinity, // Occupy the maximum available width
        child: Center(
          child: Text(
            "Add To Cart",
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

class QuantityDisplay extends StatelessWidget {
  final double price;
  final int factor;// Pass the adjusted price as a parameter
  final VoidCallback decreaseFactor;
  final VoidCallback increaseFactor;
  QuantityDisplay(this.price, this.factor, this.decreaseFactor, this.increaseFactor);

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
                print("button remove pressed");
                decreaseFactor();
              }
            ),
            Text(
              factor.toString(),
              style: TextStyle(fontSize: 16),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print("button add pressed");
                increaseFactor();
                // decreaseFactor();
              } // Call the onIncrease function when the button is pressed
            ),
          ]
        )
      ],
    );
  }
}
