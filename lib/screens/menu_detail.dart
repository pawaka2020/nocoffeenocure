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
            PartialDivider(32, 20),
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
        height: 80.0,
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

// class PartialDivider extends StatelessWidget{
//   final double pad;
//   PartialDivider(this.pad);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 32.0), // Adjust the padding as needed
//       child: Divider(height: pad),
//     );
//   }
// }

//bottommost container with buttons to adjust quantity, then button 'add to cart'
//container does not scroll down