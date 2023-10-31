import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'main.dart';
import 'models/bannernews.dart';
import 'models/fullnews.dart';
import 'models/menuitem.dart';
import 'models/user.dart';
import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

class ObjectBox {
  late final Store store;
  //new ones
  late final fullNewsBox;
  late final bannerNewsBox;
  late final menuItemBox;
  late final userBox;

  ObjectBox._create(this.store) {
    //new ones
    fullNewsBox = store.box<FullNewsOB>();
    bannerNewsBox = store.box<BannerNewsOB>();
    menuItemBox = store.box<MenuItemOB>();
    userBox = store.box<UserOB>();
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx-example"));

    return ObjectBox._create(store);
  }
}