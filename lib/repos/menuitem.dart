import '../backend/dummy/menuitem.dart';
import '../main.dart';
import '../../models/menuitem.dart';

class MenuItemRepo {
  final box = objectbox.menuItemBox;

  Future<void> update(BackendSource source) async {
    late final newData;
    late final currentData;

    if (source == BackendSource.dummy) {
      newData = await MenuItemDummy().get();
    }
    currentData = box.getAll();
    if (currentData.isNotEmpty) {
      print("replacing for MenuItem");
      box.removeAll(); //the id of 'box' does not reset to 0.
      box.putMany(newData);
    }
    else {
      print("adding for FullNewsOB");
      box.putMany(newData);
    }
  }

  List<MenuItem> getAll() {
    return convert(box.getAll());
  }

  List<MenuItem> convert(List<MenuItemOB> list) {
    List<MenuItem> result = [];
    for (var items in list) {
      result.add(items.toMenuItem());
    }
    return result;
  }
}