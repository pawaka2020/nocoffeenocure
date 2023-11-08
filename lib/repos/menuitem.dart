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

  //convert to the standard 'MenuItem' list first before returning.
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

  void printMenuItem(MenuItem menuItem) {
    print('Image Path: ${menuItem.imagePath}');
    print('Title: ${menuItem.title}');
    print('Price: \$${menuItem.price.toStringAsFixed(2)}'); // Format price as a currency
    print('Category: ${menuItem.category}');
    print('Description: ${menuItem.description}');
    print('Available: ${menuItem.available ? 'Yes' : 'No'}');

    print('User Reviews:');
    for (var review in menuItem.userReviews) {
      print('  Name: ${review.name}');
      print('  Message: ${review.message}');
      print('  Stars: ${review.stars}');
    }

    print('Additions:');
    for (var addition in menuItem.additions) {
      print('  Title: ${addition.title}');
      print('  Selected Price: \$${addition.selectedPrice.toStringAsFixed(2)}');
      print('  Selected Index: ${addition.selectedIndex.toString()}');
      print('  Addition Details:');
      for (var detail in addition.additionDetails) {
        print('    Name: ${detail.name}');
        print('    Price: \$${detail.price.toStringAsFixed(2)}');
      }
    }

    print('Ingredients:');
    for (var ingredient in menuItem.ingredients) {
      print('  Name: ${ingredient.name}');
      print('  Image Path: ${ingredient.imagePath}');
    }
  }

}