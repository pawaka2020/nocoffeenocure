import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nocoffeenocure/dummy_screen.dart';

class News {
  final int id;
  final String imageUrl;

  News(this.id, this.imageUrl);
}

final List<News> newsDummy = [
  News(1, "assets/images/bannerimage1.png"),
  News(2, "assets/images/bannerimage2.png"),
];

//with auto-slide, the one currently in use
class TopBanner extends StatefulWidget {
  final double bannerHeight = 180; // Size of the banner
  final List<News> news = newsDummy; // Data source
  final int interval = 3; // seconds for banner to auto-slide.

  @override
  _TopBannerState createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _timer = Timer.periodic(Duration(seconds: widget.interval), (timer) {
      if (_currentPage < widget.news.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.bannerHeight,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.news.length,
        itemBuilder: (context, index) {
          final news_ = widget.news[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DummyScreen(),
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(news_.imageUrl),
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
// Future<List<Promotion>> fetchPromotionsDummy() async {
//   await Future.delayed(Duration(seconds: 0));
//   return [
//     Promotion(1, "assets/images/bannerimage1.png"),
//     Promotion(2, "assets/images/bannerimage2.png"),
//   ];
// }
//
// class TopBanner3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Promotion>>(
//       future: fetchPromotionsDummy(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // While waiting for data, display a loading indicator
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           // If there's an error, display an error message
//           return Text('Error: ${snapshot.error}');
//         } else {
//           // Once data is available, display promotions
//           final promotions = snapshot.data;
//           return Container(
//             height: 125, // Adjust the value as needed
//             child: PageView.builder(
//               itemCount: promotions?.length,
//               itemBuilder: (context, index) {
//                 final promotion = promotions?[index];
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigate to the promotion detail page with the promotion ID
//                     Navigator.of(context).push(MaterialPageRoute(
//                         //builder: (context) => PromotionDetailPage(promotion.id),
//                         builder: (context) => DummyScreen()
//                     ));
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage(promotion!.imageUrl),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         }
//       },
//     );
//   }
// }