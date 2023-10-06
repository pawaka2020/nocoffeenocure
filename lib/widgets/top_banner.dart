//done. Just add fancier banners later.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBanner extends StatefulWidget {
  @override
  _TopBannerState createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  final List<String> imagePaths = [
    //'assets/images/tiny.png'
    'assets/images/newsbanner1.png',
    'assets/images/newsbanner2.png',
    'assets/images/newsbanner3.png'
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: imagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          imagePaths[index],
          //fit: BoxFit.cover, // Adjust the image fit as needed
        );
      },
    );
  }
}