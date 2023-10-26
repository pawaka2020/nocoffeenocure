import '../../model.dart';

class TopBannerNewsDummy {

  Future<List<TopBannerNews>> get() async {
    int delay = 3;

    await Future.delayed(Duration(seconds: delay));
    List<TopBannerNews> result = [
      TopBannerNews()..image = "assets/images/bannerimage1.png"..article = "article 1",
      TopBannerNews()..image = "assets/images/bannerimage2.png"..article = "article 2",
    ];
    return result;
  }
}