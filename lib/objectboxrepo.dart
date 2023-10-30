import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'main.dart';
import 'model.dart';
import 'models/bannernews.dart';
import 'models/fullnews.dart';
import 'models/menuitem.dart';
import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

class ObjectBox {
  late final Store store;
  late final newsFullBox;
  late final topBannerNewsBox;
  late final menuItemMapBox;
  //new ones
  late final fullNewsBox;
  late final bannerNewsBox;
  late final menuItemBox;

  ObjectBox._create(this.store) {
    newsFullBox = store.box<NewsFull>();
    topBannerNewsBox = store.box<TopBannerNews>();
    menuItemMapBox = store.box<MenuItemMap>();
    //new ones
    fullNewsBox = store.box<FullNewsOB>();
    bannerNewsBox = store.box<BannerNewsOB>();
    menuItemBox = store.box<MenuItemOB>();
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx-example"));

    return ObjectBox._create(store);
  }
}

class NewsFullRepo {
  late final newsFullBox;

  NewsFullRepo(){
    newsFullBox = objectbox.store.box<NewsFull>();
  }
}