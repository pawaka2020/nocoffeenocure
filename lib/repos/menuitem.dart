class MenuItem {
  final String imagePath;
  final String title;
  //final String price;
  final double price;
  final String category;
  final String description;
  final List<UserReview> userReviews;
  final List<Addition> additions;
  final List<Ingredient> ingredients;
  final bool available;

  MenuItem(this.imagePath, this.title, this.price, this.category,
      this.description,this.userReviews, this.additions, this.ingredients,
      this.available);
}

//reviews ie ("Rick Seller", "This coffee is awesome!" "5")
class UserReview {
  final String name;
  final String message;
  final int stars;

  UserReview(this.name, this.message, this.stars);
}

//additions to customize the menu item ie 'beans', 'sugar', 'honey', 'serving size'
class Addition {
    final String title;
    final List<AdditionDetail> additionDetails;
    double selectedPrice = 0; // Change the type to double


    Addition(this.title, this.additionDetails);
}

//more detail to an addtion ie if 'beans' under Addition class it was nested in, then 'soya beans' with 'USD 4.00'
class AdditionDetail {
  final String name;
  final double price;

  AdditionDetail(this.name, this.price);
}

//ingredients that define the menu item with accompanying picture, ie 'beans' with image of beans
class Ingredient {
  final String name;
  final String imagePath;

  Ingredient(this.name,this.imagePath);
}