import '../backend/dummy/bannernews.dart';
import '../backend/online/bannernews.dart';
import '../main.dart';
import '../models/bannernews.dart';

class BannerNewsRepo {
  final box = objectbox.bannerNewsBox;

  Future<void> update(BackendSource source) async {
    late final newData;
    //late final currentData;

    if (source == BackendSource.dummy) {
      newData = await BannerNewsDummy().get();
    }
    else if (source == BackendSource.online) {
      newData = await BannerNewsOnline().get();
    }
    // currentData = box.getAll();
    // if (currentData.isNotEmpty) {
    //   print("replacing for BannerNewsOB");
    //   box.removeAll(); //the id of 'box' does not reset to 0.
    //   box.putMany(newData);
    // }
    // else {
    //   print("adding for FullNewsOB");
    //   box.putMany(newData);
    // }
    box.removeAll(); //the id of 'box' does not reset to 0.
    box.putMany(newData);
  }

  List<BannerNewsOB> getAll() {
    return box.getAll();
  }
}