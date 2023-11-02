import 'package:objectbox/objectbox.dart';

//default class
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
      ..menuItem.target = menuItemOB;

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
      ..imagePath = ingredient.imagePath
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
}

@Entity()
class AdditionOB {
  @Id()
  int id = 0;

  String? title;
  double selectedPrice = 0;

  final menuItem = ToOne<MenuItemOB>();
  @Backlink()
  final additionDetails = ToMany<AdditionDetailOB>();

  Addition toAddition() {
    return Addition(
      this.title ?? '',
      this.additionDetails.map((detail) => detail.toAdditionDetail()).toList(),
    );
  }
}

@Entity()
class AdditionDetailOB {
  @Id()
  int id = 0;

  String? name;
  double? price;

  final addition = ToOne<AdditionOB>();

  AdditionDetail toAdditionDetail() {
    return AdditionDetail(
      this.name ?? '',
      this.price ?? 0.0,
    );
  }
}

@Entity()
class IngredientOB {
  @Id()
  int id = 0;

  String? name;
  String? imagePath;

  final menuItem = ToOne<MenuItemOB>();

  Ingredient toIngredient() {
    return Ingredient(
      this.name ?? '',
      this.imagePath ?? '',
    );
  }
}