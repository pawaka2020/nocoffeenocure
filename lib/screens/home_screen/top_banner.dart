import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nocoffeenocure/dummy_screen.dart';
import '../../main.dart';
import '../../repos/bannernews.dart';

//with auto-slide, the one currently in use
class TopBanner extends StatefulWidget {
  final double bannerHeight = 180; // Size of the banner
  final news = BannerNewsRepo().getAll();
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
                  //image: AssetImage(news_.imageUrl),
                  image: AssetImage(news_.image!),
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

