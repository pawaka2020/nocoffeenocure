import '../../common.dart';
import '../../models/bannernews.dart';

class BannerNewsDummy {
  Future<List<BannerNewsOB>> get() async {
    int delay = 0;
    await Future.delayed(Duration(seconds: delay));

    List<BannerNewsOB> result = [
      BannerNewsOB()
        ..image = await copyAssetToStorage("assets/images/bannerimage1.png")
        ..article = "article 1",
      BannerNewsOB()
        ..image = await copyAssetToStorage("assets/images/bannerimage2.png")
        ..article = "article 2",
    ];
    return result;
  }
}