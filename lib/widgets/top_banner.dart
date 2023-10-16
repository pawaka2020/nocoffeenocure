import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nocoffeenocure/dummy_screen.dart';

class TopBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125, // Adjust the value as needed
      child: PageView(
        children: [
          //Page(child: YourPageContentWidget1()),
          //Page(child: YourPageContentWidget2()),
        ],
      ),
    );
  }
}

class Promotion {
  final int id;
  final String imageUrl;

  Promotion(this.id, this.imageUrl);
}

class TopBanner2 extends StatelessWidget {
  final List<Promotion> promotions = [
    Promotion(1, "assets/images/bannerimage1.png"),
    Promotion(2, "assets/images/bannerimage2.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180, // Adjust the value as needed
      child: PageView.builder(
        itemCount: promotions.length,
        itemBuilder: (context, index) {
          final promotion = promotions[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                //builder: (context) => PromotionDetailPage(promotion.id),
                builder: (context) => DummyScreen()
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(promotion.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//for async requests
//place this in a dedicated 'data' folder later, with subfolders 'offline', 'online' and 'dummy'.
// Simulate fetching promotions from a backend (replace with actual API call)
Future<List<Promotion>> fetchPromotionsDummy() async {
  await Future.delayed(Duration(seconds: 5));
  return [
    Promotion(1, "assets/images/bannerimage1.png"),
    Promotion(2, "assets/images/bannerimage2.png"),
  ];
}

class TopBanner3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Promotion>>(
      future: fetchPromotionsDummy(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for data, display a loading indicator
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // If there's an error, display an error message
          return Text('Error: ${snapshot.error}');
        } else {
          // Once data is available, display promotions
          final promotions = snapshot.data;
          return Container(
            height: 125, // Adjust the value as needed
            child: PageView.builder(
              itemCount: promotions?.length,
              itemBuilder: (context, index) {
                final promotion = promotions?[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to the promotion detail page with the promotion ID
                    Navigator.of(context).push(MaterialPageRoute(
                        //builder: (context) => PromotionDetailPage(promotion.id),
                        builder: (context) => DummyScreen()
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(promotion!.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}