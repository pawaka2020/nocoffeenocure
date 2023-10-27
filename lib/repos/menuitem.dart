// class MenuItem {
//   final String imagePath;
//   final String title;
//   final double price;
//   final String category;
//   final String description;
//   final List<UserReview> userReviews;
//   final List<Addition> additions;
//   final List<Ingredient> ingredients;
//   final bool available;
//
//   MenuItem(this.imagePath, this.title, this.price, this.category,
//       this.description,this.userReviews, this.additions, this.ingredients,
//       this.available);
//
//   //toJson();
//
//   //fromJson();
//
// }
//
// //reviews ie ("Rick Seller", "This coffee is awesome!" "5")
// class UserReview {
//   final String name;
//   final String message;
//   final int stars;
//
//   UserReview(this.name, this.message, this.stars);
// }
//
// //additions to customize the menu item ie 'beans', 'sugar', 'honey', 'serving size'
// class Addition {
//     final String title;
//     final List<AdditionDetail> additionDetails;
//     double selectedPrice = 0; // Change the type to double
//
//     Addition(this.title, this.additionDetails);
// }
//
// //more detail to an addtion ie if 'beans' under Addition class it was nested in, then 'soy' with 'USD 4.00'
// class AdditionDetail {
//   final String name;
//   final double price;
//
//   AdditionDetail(this.name, this.price);
// }
//
// //ingredients that define the menu item with accompanying picture, ie 'beans' with image of beans
// class Ingredient {
//   final String name;
//   final String imagePath;
//
//   Ingredient(this.name,this.imagePath);
// }

import '../main.dart';
import '../model.dart';

class MenuItem {
  final String imagePath;
  final String title;
  final double price;
  final String category;
  final String description;
  final List<UserReview> userReviews;
  final List<Addition> additions;
  final List<Ingredient> ingredients;
  final bool available;

  MenuItem(this.imagePath, this.title, this.price, this.category, this.description, this.userReviews, this.additions, this.ingredients, this.available);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    data['title'] = this.title;
    data['price'] = this.price;
    data['category'] = this.category;
    data['description'] = this.description;
    data['userReviews'] = this.userReviews.map((review) => review.toJson()).toList();
    data['additions'] = this.additions.map((addition) => addition.toJson()).toList();
    data['ingredients'] = this.ingredients.map((ingredient) => ingredient.toJson()).toList();
    data['available'] = this.available;
    return data;
  }

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      json['imagePath'],
      json['title'],
      json['price'].toDouble(),
      json['category'],
      json['description'],
      (json['userReviews'] as List).map((review) => UserReview.fromJson(review)).toList(),
      (json['additions'] as List).map((addition) => Addition.fromJson(addition)).toList(),
      (json['ingredients'] as List).map((ingredient) => Ingredient.fromJson(ingredient)).toList(),
      json['available'],
    );
  }
}

class UserReview {
  final String name;
  final String message;
  final int stars;

  UserReview(this.name, this.message, this.stars);

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'message': this.message,
      'stars': this.stars,
    };
  }

  factory UserReview.fromJson(Map<String, dynamic> json) {
    return UserReview(json['name'], json['message'], json['stars']);
  }
}

class Addition {
  final String title;
  final List<AdditionDetail> additionDetails;
  double selectedPrice = 0; // Change the type to double

  Addition(this.title, this.additionDetails);

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'additionDetails': this.additionDetails.map((detail) => detail.toJson()).toList(),
    };
  }

  factory Addition.fromJson(Map<String, dynamic> json) {
    return Addition(json['title'], (json['additionDetails'] as List).map((detail) => AdditionDetail.fromJson(detail)).toList());
  }
}

class AdditionDetail {
  final String name;
  final double price;

  AdditionDetail(this.name, this.price);

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'price': this.price,
    };
  }

  factory AdditionDetail.fromJson(Map<String, dynamic> json) {
    return AdditionDetail(json['name'], json['price'].toDouble());
  }
}

class Ingredient {
  final String name;
  final String imagePath;

  Ingredient(this.name, this.imagePath);

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'imagePath': this.imagePath,
    };
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(json['name'], json['imagePath']);
  }
}

class MenuItemRepo{
  final box = objectbox.menuItemMapBox;

  List<MenuItem> load() {
    var map;
    final List<MenuItemMap> menuItemMaps = box.getAll();
    final List<MenuItem> menuItems = [];
    for (var menuItemMap in menuItemMaps) {
        map = menuItemMap.map;
        menuItems.add(MenuItem.fromJson(map));
    }
    return menuItems;
  }
}
