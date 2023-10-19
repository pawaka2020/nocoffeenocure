import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../repos/menuitem.dart';
import '../widgets/partial_divider.dart';

class MenuDetailsPage extends StatelessWidget {
  final MenuItem menuItem;

  MenuDetailsPage(this.menuItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuItem.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MenuImage(menuItem.imagePath),
            Description(menuItem.description),
            PartialDivider(32, 10),
            Reviews(menuItem.userReviews),
            PartialDivider(32, 10),
            //SizedBox(height: 5),
            Column(
              children: menuItem.additions.map((addition) {
                return AdditionMenu3(addition);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuImage extends StatelessWidget{
  final String imagePath;

  MenuImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,   //default 150
      height: 333,
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

class AdditionMenu extends StatelessWidget {
  final Addition addition;
  AdditionMenu(this.addition);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Align(
              alignment:Alignment.centerLeft,
              child: Text(addition.title),
          ),
        ),
        Column(
          children: addition.additionDetails.map((additionDetail) {
            return Column(
              children:[
                SizedBox(height: 25), //15
                AdditionMenuDetail(additionDetail)
              ]
            );
          }).toList(),
        ),
        PartialDivider(32, 20),
      ]
    );
  }
}

//TODO: set icon to 'radio_button_checked' when this widget is selected and
//the other widgets set icon to 'radio_button_unchecked'
class AdditionMenuDetail extends StatelessWidget {
  final AdditionDetail additionDetail;
  AdditionMenuDetail(this.additionDetail);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children:[
          Icon(
            Icons.radio_button_unchecked, // Circle icon (unchecked)
            color: Colors.grey, // Initial color
            size: 18, // Adjust the size as needed
          ),
          SizedBox(width: 8), // Add some space between the icon and text
          Text(
            additionDetail.name, // Text from additionDetail.name
            style: TextStyle(
              fontSize: 12, // Adjust the font size as needed
            ),
          ),
          Spacer(), // Adds flexible space between text and price
          Text(
            additionDetail.price, // Text from additionDetail.price
            style: TextStyle(
              fontSize: 12, // Adjust the font size as needed
              fontWeight: FontWeight.bold, // Optional: Make the price bold
            ),
          ),
        ],
      ),
    );
  }
}

/////

class AdditionMenu2 extends StatefulWidget {
  final Addition addition;
  AdditionMenu2(this.addition);

  @override
  _AdditionMenuState2 createState() => _AdditionMenuState2();
}

class _AdditionMenuState2 extends State<AdditionMenu2> {
  int selectedDetailIndex = -1;

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
            return AdditionMenuDetail2(
              additionDetail,
              isSelected: index == selectedDetailIndex,
              onTap: () {
                setState(() {
                  selectedDetailIndex = index;
                });
              },
            );
          }).toList(),
        ),
        PartialDivider(32, 10),
      ],
    );
  }
}

class AdditionMenuDetail2 extends StatelessWidget {
  final AdditionDetail additionDetail;
  final bool isSelected;
  final VoidCallback onTap;

  AdditionMenuDetail2(this.additionDetail, {required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
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
            additionDetail.price,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


///////

class AdditionMenu3 extends StatefulWidget {
  final Addition addition;
  AdditionMenu3(this.addition);

  @override
  _AdditionMenuState3 createState() => _AdditionMenuState3();
}

class _AdditionMenuState3 extends State<AdditionMenu3> {
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
            return AdditionMenuDetail3(
              additionDetail,
              isSelected: index == selectedDetailIndex,
              onTap: () {
                setState(() {
                  selectedDetailIndex = index;
                });
              },
            );
          })
              .toList(),
        ),
        PartialDivider(32, 20),
      ],
    );
  }
}

class AdditionMenuDetail3 extends StatelessWidget {
  final AdditionDetail additionDetail;
  final bool isSelected;
  final VoidCallback onTap;

  AdditionMenuDetail3(this.additionDetail, {required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
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
            additionDetail.price,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
