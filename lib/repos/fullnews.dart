import '../backend/dummy/fullnews.dart';
import '../main.dart';
import '../models/fullnews.dart';

class FullNewsRepo {
  final box = objectbox.fullNewsBox;

  Future<void> update(BackendSource source) async {
    late final newData;
    late final currentData;

    if (source == BackendSource.dummy) {
      newData = await FullNewsDummy().get();
    }

    currentData = box.getAll();

    if (currentData.isNotEmpty) {
      print("replacing for FullNewsOB");
      box.removeAll(); //the id of 'box' does not reset to 0.
      box.putMany(newData);
    }
    else {
      print("adding for FullNewsOB");
      box.putMany(newData);
    }

    //print("current = " + currentData[0].name);
  }

  List<FullNewsOB> getAll() {
    return box.getAll();
  }
}