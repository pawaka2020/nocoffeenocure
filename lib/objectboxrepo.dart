import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'main.dart';
import 'models/bannernews.dart';
import 'models/cartitem.dart';
import 'models/fullnews.dart';
import 'models/menuitem.dart';
import 'models/order.dart';
import 'models/token.dart';
import 'models/user.dart';
import 'models/voucher.dart';
import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

class ObjectBox {
  late final Store store;
  //new ones
  late final fullNewsBox;
  late final bannerNewsBox;
  late final menuItemBox;
  late final userBox;
  late final cartItemBox;
  late final voucherBox;
  late final orderBox;
  //
  late final tokenBox;

  ObjectBox._create(this.store) {
    //new ones
    fullNewsBox = store.box<FullNewsOB>();
    bannerNewsBox = store.box<BannerNewsOB>();
    menuItemBox = store.box<MenuItemOB>();
    userBox = store.box<UserOB>();
    cartItemBox = store.box<CartItemOB>();
    voucherBox = store.box<VoucherOB>();
    tokenBox = store.box<TokenOB>();
    orderBox = store.box<OrderOB>();
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx-example"));

    return ObjectBox._create(store);
  }
}