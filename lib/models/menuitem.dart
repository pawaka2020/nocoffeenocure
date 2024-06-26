import 'package:objectbox/objectbox.dart';

import 'cartitem.dart';

//default class
//make your changes here.
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

  //conversion functions
  MenuItemOB toMenuItemOB() {
    final menuItemOB = MenuItemOB()
      ..imagePath = this.imagePath
      ..title = this.title
      ..price = this.price
      ..category = this.category
      ..description = this.description
      ..available = this.available;

    menuItemOB.userReviews.addAll(this.userReviews.map((review) => convertUserReview(review, menuItemOB)));

    menuItemOB.additions.addAll(this.additions.map((addition) => convertAddition(addition, menuItemOB)));

    menuItemOB.ingredients.addAll(this.ingredients.map((ingredient) => convertIngredient(ingredient, menuItemOB)));
    return menuItemOB;
  }

  UserReviewOB convertUserReview(UserReview userReview, MenuItemOB menuItemOB) {
    final userReviewOB = UserReviewOB()
      ..name = userReview.name
      ..message = userReview.message
      ..stars = userReview.stars
      ..menuItem.target = menuItemOB;

    return userReviewOB;
  }

  AdditionOB convertAddition(Addition addition, MenuItemOB menuItemOB) {
    final additionOB = AdditionOB()
      ..title = addition.title
      ..selectedPrice = addition.selectedPrice
      ..selectedIndex = addition.selectedIndex
      ..menuItem.target = menuItemOB
    ;
    additionOB.additionDetails.addAll(addition.additionDetails.map((detail) => convertAdditionDetail(detail, additionOB)));

    return additionOB;
  }

  AdditionDetailOB convertAdditionDetail(AdditionDetail additionDetail, AdditionOB additionOB) {
    final additionDetailOB = AdditionDetailOB()
      ..name = additionDetail.name
      ..price = additionDetail.price
      ..addition.target = additionOB;

    return additionDetailOB;
  }

  IngredientOB convertIngredient(Ingredient ingredient, MenuItemOB menuItemOB) {
    final ingredientOB = IngredientOB()
      ..name = ingredient.name
      ..menuItem.target = menuItemOB;

    return ingredientOB;
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
  //double selectedPrice = 0; //change this one
  double selectedPrice;
  int selectedIndex;
  final List<AdditionDetail> additionDetails;

  //new variable. Let's see if adding this variable won't change things.
  Addition(this.title, this.selectedIndex, this.selectedPrice, this.additionDetails);

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'additionDetails': this.additionDetails.map((detail) => detail.toJson()).toList(),
    };
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


  Ingredient(this.name);

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,

    };
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(json['name']);
  }
}

//modified parallel class to be used with ObjectBox
@Entity()
class MenuItemOB {
  @Id()
  int id = 0;

  String? imagePath;
  String? title;
  double? price;
  String? category;
  String? description;
  bool? available;

  @Backlink()
  final userReviews = ToMany<UserReviewOB>();
  @Backlink()
  final additions = ToMany<AdditionOB>();
  @Backlink()
  final ingredients = ToMany<IngredientOB>();

  var cartItem = ToOne<CartItemOB>();

  //conversion functions
  MenuItem toMenuItem() {
    return MenuItem(
      this.imagePath ?? "",
      this.title ?? "",
      this.price ?? 0.0,
      this.category ?? "",
      this.description ?? "",
      this.userReviews.map((review) => review.toUserReview()).toList(),
      this.additions.map((addition) => addition.toAddition()).toList(),
      this.ingredients.map((ingredient) => ingredient.toIngredient()).toList(),
      this.available ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagepath': imagePath,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'available': available,
      'userreviews': userReviews.map((review) => review.toJson()).toList(),
      'additions': additions.map((addition) => addition.toJson()).toList(),
      'ingredients': ingredients.map((ingredient) => ingredient.toJson()).toList(),
    };
  }
  MenuItemOB();

  // Define a fromJson method to create a MenuItemOB instance from JSON data
  factory MenuItemOB.fromJson(Map<String, dynamic> json) {
    MenuItemOB menuItem = MenuItemOB()
      ..id = json['id'] ?? 0
      ..imagePath = json['imagepath']
      ..title = json['title']
      ..price = json['price'] ?? 0
      ..category = json['category']
      ..description = json['description']
      ..available = json['available'] ?? false
    ;

    menuItem.userReviews.addAll(UserReviewOB.listFromJson(json['userreviews'] ?? [])); //UserReviewOB.listFromJson(json['userreviews'] ?? []
    menuItem.additions.addAll(AdditionOB.listFromJson(json['additions'] ?? [])); //AdditionOB.listFromJson(json['additions'] ?? [])
    menuItem.ingredients.addAll(IngredientOB.listFromJson(json['ingredients'] ?? [])); //IngredientOB.listFromJson(json['ingredients'] ?? [])

    return menuItem;
  }

  // Define a listFromJson method to create a list of MenuItemOB instances from a list of JSON data
  static List<MenuItemOB> listFromJson(List<dynamic> jsonList) {
    List<MenuItemOB> items = [];
    for (var json in jsonList) {
      items.add(MenuItemOB.fromJson(json));
    }
    return items;
  }

}

@Entity()
class UserReviewOB {
  @Id()
  int id = 0;

  String? name;
  String? message;
  int? stars;

  final menuItem = ToOne<MenuItemOB>();

  UserReview toUserReview() {
    return UserReview(
      this.name ?? '',
      this.message ?? '',
      this.stars ?? 0,
    );
  }

  UserReviewOB();

  // Define a fromJson method to create a UserReviewOB instance from JSON data
  factory UserReviewOB.fromJson(Map<String, dynamic> json) {
    return UserReviewOB()
      ..id = json['id'] ?? 0
      ..name = json['name'] ?? ''
      ..message = json['message'] ?? ''
      ..stars = json['stars'] ?? 0
    ;
  }

  // Define a listFromJson method to create a list of UserReviewOB instances from a list of JSON data
  static List<UserReviewOB> listFromJson(List<dynamic> jsonList) {
    List<UserReviewOB> items = [];
    for (var json in jsonList) {
      items.add(UserReviewOB.fromJson(json));
    }
    return items;
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'message': message,
      'stars': stars,
    };
  }
}

@Entity()
class AdditionOB {
  @Id()
  int id = 0;

  String? title;
  double? selectedPrice;
  int? selectedIndex;

  final menuItem = ToOne<MenuItemOB>();
  @Backlink()
  final additionDetails = ToMany<AdditionDetailOB>();

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'selectedPrice': selectedPrice,
      'selectedIndex': selectedIndex,
      'additionDetails': additionDetails.map((detail) => detail.toAdditionDetail()).toList(),
    };
  }

  Addition toAddition() {
    return Addition(
      this.title ?? '',
      this.selectedIndex ?? 0,
      this.selectedPrice ?? 0,
      this.additionDetails.map((detail) => detail.toAdditionDetail()).toList(),
    );
  }

  AdditionOB();

  // Define a fromJson method to create an AdditionOB instance from JSON data
  factory AdditionOB.fromJson(Map<String, dynamic> json) {
    final addition = AdditionOB()
      ..id = json['id'] ?? 0
      ..title = json['title'] ?? ''
      ..selectedPrice = json['selectedPrice'] ?? 0
      ..selectedIndex = json['selectedIndex'] ?? 0
    ;
    addition.additionDetails.addAll(AdditionDetailOB.listFromJson(json['additionDetails'] ?? []));

    return addition;
  }

  static List<AdditionOB> listFromJson(List<dynamic> jsonList) {
    List<AdditionOB> items = [];
    for (var json in jsonList) {
      items.add(AdditionOB.fromJson(json));
    }
    return items;
  }
}

@Entity()
class AdditionDetailOB {
  @Id()
  int id = 0;

  String? name;
  double? price;

  final addition = ToOne<AdditionOB>();

  AdditionDetailOB();

  // Define a fromJson method to create an AdditionDetailOB instance from JSON data
  factory AdditionDetailOB.fromJson(Map<String, dynamic> json) {
    return AdditionDetailOB()
      ..id = json['id'] ?? 0
      ..name = json['name'] ?? ''
      ..price = json['price'] ?? 0
    ;
  }

  // Define a listFromJson method to create a list of AdditionDetailOB instances from a list of JSON data
  static List<AdditionDetailOB> listFromJson(List<dynamic> jsonList) {
    List<AdditionDetailOB> items = [];
    for (var json in jsonList) {
      items.add(AdditionDetailOB.fromJson(json));
    }
    return items;
  }

  AdditionDetail toAdditionDetail() {
    return AdditionDetail(
      this.name ?? '',
      this.price ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }
}

@Entity()
class IngredientOB {
  @Id()
  int id = 0;

  String? name;
  String? imagePath;

  final menuItem = ToOne<MenuItemOB>();

  IngredientOB();

  // Define a fromJson method to create an IngredientOB instance from JSON data
  factory IngredientOB.fromJson(Map<String, dynamic> json) {
    return IngredientOB()
      ..id = json['id'] ?? 0
      ..name = json['name'] ?? ''
      ..imagePath = json['imagePath'] ?? ''
    ;
  }

  // Define a listFromJson method to create a list of IngredientOB instances from a list of JSON data
  static List<IngredientOB> listFromJson(List<dynamic> jsonList) {
    List<IngredientOB> items = [];
    for (var json in jsonList) {
      items.add(IngredientOB.fromJson(json));
    }
    return items;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imagePath': imagePath,
    };
  }

  Ingredient toIngredient() {
    return Ingredient(
      this.name ?? '',
    );
  }
}

/*
 for debugging purposes only.
*/
void printMenuItemOB(MenuItemOB menuItem) {
  print('MenuItemOB:');
  print('ID: ${menuItem.id}');
  print('Image Path: ${menuItem.imagePath ?? 'N/A'}');
  print('Title: ${menuItem.title ?? 'N/A'}');
  print('Price: ${menuItem.price ?? 0.0}');
  print('Category: ${menuItem.category ?? 'N/A'}');
  print('Description: ${menuItem.description ?? 'N/A'}');
  print('Available: ${menuItem.available ?? false}');

  // Print UserReviews
  print('User Reviews:');
  for (var review in menuItem.userReviews) {
    print('Name: ${review.name ?? 'N/A'}');
    print('Message: ${review.message ?? 'N/A'}');
    print('Stars: ${review.stars ?? 0}');
  }

  // Print Additions
  print('Additions:');
  for (var addition in menuItem.additions) {
    print('Title: ${addition.title ?? 'N/A'}');
    print('Selected Price: ${addition.selectedPrice}');
    print('Selected Index: ${addition.selectedIndex}');

    // Print AdditionDetails
    print('Addition Details:');
    for (var detail in addition.additionDetails) {
      print('Name: ${detail.name ?? 'N/A'}');
      print('Price: ${detail.price ?? 0.0}');
    }
  }

  // Print Ingredients
  print('Ingredients:');
  for (var ingredient in menuItem.ingredients) {
    print('Name: ${ingredient.name ?? 'N/A'}');
    print('Image Path: ${ingredient.imagePath ?? 'N/A'}');
  }
}