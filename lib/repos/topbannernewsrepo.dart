import '../backend/dummy/topbannernews_dummy.dart';
import '../main.dart';
import '../model.dart';

// @Entity()
// class TopBannerNews {
//   @Id()
//   int id = 0;
//
//   String? image;
//   String? article;
// }

class TopBannerNewsRepo {
  Future<void> update(BackendSource source) async {
    final box = objectbox.topBannerNewsBox;
    late final newData;
    late final currentData;

    //fetch from backend source
    if (source == BackendSource.dummy) {
      newData = await TopBannerNewsDummy().get();
    }
    else if (source == BackendSource.backend) {}
    currentData = box.getAll();

    //replace 'currentData' inside 'box' with 'newData'
    if (currentData.isNotEmpty) {
      print("replacing for TopBannerNews");
      box.removeAll(); //the id of 'box' does not reset to 0.
      box.putMany(newData);
    }
    //'box' is empty, so just add 'newData' into 'box'
    else {
      print("adding for TopBannerNews");
      box.putMany(newData);
    }

    //print every object within TopBannerNews array for testing
    display(box.getAll());
  }

  void display(List<TopBannerNews> list) {
    for (var object in list) {
      print('TopBannerNews Object ID: ${object.id}');
      print('Image: ${object.image}');
      print('Article: ${object.article}');
      // Add more fields here if needed
      print('---------------');
    }
  }
}