import '../../models/cartitem.dart';
import '../../models/menuitem.dart';

class CartItemDummy {
  Future<List<CartItemOB>> get() async {
    int delay = 0;
    await Future.delayed(Duration(seconds: delay));

    // List<CartItemOB> result = [
    //   CartItemOB()
    //     ..image = 'assets/images/coffeesample.png'
    //     ..name = 'Item 1'
    //     ..content = 'Beans: Supremo | Sweetness: Less sugar | Cup size: Regular'
    //     ..quantity = 3
    //     ..menuItem_id = 2
    //     ..menuItemOB.add(MenuItem(
    //         'assets/images/coffeesample.png',
    //         'I DONT SLEEP',
    //         10.00,
    //         'Coffee',
    //         'A rich and bold blend that promises to keep you wide awake and invigorated. '
    //             'Crafted from premium, handpicked coffee beans, this dark roast boasts '
    //             'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
    //         [
    //           UserReview("Richard", "Powerful!", 5),
    //           UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
    //         ],
    //         [
    //           Addition(
    //               "Beans",
    //               [
    //                 AdditionDetail("Supremo", 0.00),
    //                 AdditionDetail("Yir", 5.45),
    //                 AdditionDetail("Mandheling", 8.00)
    //               ]
    //           ),
    //           Addition(
    //               "Sweetness",
    //               [
    //                 AdditionDetail("Less sugar", 0),
    //                 AdditionDetail("More sugar", 1.00),
    //               ]
    //           ),
    //         ],
    //         [
    //           Ingredient("Supremo", "assets/image/tiny.png"),
    //           Ingredient("Lemon", "assets/image/tiny.png"),
    //           Ingredient("Soda lemon", "assets/image/tiny.png"),
    //         ],
    //         true
    //     ).toMenuItemOB())
    //   ,
    //   CartItemOB()
    //     ..image = 'assets/images/coffeesample.png'
    //     ..name = 'Item 2'
    //     ..content = 'Beans: Soy | Sweetness: Less sugar'
    //     ..quantity = 5
    //     ..menuItem_id = 5
    //     ..menuItemOB.add(MenuItem(
    //         'assets/images/coffeesample.png',
    //         'I DONT SLEEP',
    //         10.00,
    //         'Coffee',
    //         'A rich and bold blend that promises to keep you wide awake and invigorated. '
    //             'Crafted from premium, handpicked coffee beans, this dark roast boasts '
    //             'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
    //         [
    //           UserReview("Richard", "Powerful!", 5),
    //           UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
    //         ],
    //         [
    //           Addition(
    //               "Beans",
    //               [
    //                 AdditionDetail("Supremo", 0.00),
    //                 AdditionDetail("Yir", 5.45),
    //                 AdditionDetail("Mandheling", 8.00)
    //               ]
    //           ),
    //           Addition(
    //               "Sweetness",
    //               [
    //                 AdditionDetail("Less sugar", 0),
    //                 AdditionDetail("More sugar", 1.00),
    //               ]
    //           ),
    //         ],
    //         [
    //           Ingredient("Supremo", "assets/image/tiny.png"),
    //           Ingredient("Lemon", "assets/image/tiny.png"),
    //           Ingredient("Soda lemon", "assets/image/tiny.png"),
    //         ],
    //         true
    //     ).toMenuItemOB())
    //   ,
    //   CartItemOB()
    //     ..image = 'assets/images/coffeesample.png'
    //     ..name = 'Item 3'
    //     ..content = 'Beans: Soy | Sweetness: Less sugar'
    //     ..quantity = 5
    //     ..menuItem_id = 5
    //     ..menuItemOB.add(MenuItem(
    //         'assets/images/coffeesample.png',
    //         'I DONT SLEEP',
    //         10.00,
    //         'Coffee',
    //         'A rich and bold blend that promises to keep you wide awake and invigorated. '
    //             'Crafted from premium, handpicked coffee beans, this dark roast boasts '
    //             'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
    //         [
    //           UserReview("Richard", "Powerful!", 5),
    //           UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
    //         ],
    //         [
    //           Addition(
    //               "Beans",
    //               [
    //                 AdditionDetail("Supremo", 0.00),
    //                 AdditionDetail("Yir", 5.45),
    //                 AdditionDetail("Mandheling", 8.00)
    //               ]
    //           ),
    //           Addition(
    //               "Sweetness",
    //               [
    //                 AdditionDetail("Less sugar", 0),
    //                 AdditionDetail("More sugar", 1.00),
    //               ]
    //           ),
    //         ],
    //         [
    //           Ingredient("Supremo", "assets/image/tiny.png"),
    //           Ingredient("Lemon", "assets/image/tiny.png"),
    //           Ingredient("Soda lemon", "assets/image/tiny.png"),
    //         ],
    //         true
    //     ).toMenuItemOB())
    //   ,
    //   CartItemOB()
    //     ..image = 'assets/images/coffeesample.png'
    //     ..name = 'Item 4'
    //     ..content = 'Beans: Soy | Sweetness: Less sugar'
    //     ..quantity = 5
    //     ..menuItem_id = 5
    //     ..menuItemOB.add(MenuItem(
    //         'assets/images/coffeesample.png',
    //         'I DONT SLEEP',
    //         10.00,
    //         'Coffee',
    //         'A rich and bold blend that promises to keep you wide awake and invigorated. '
    //             'Crafted from premium, handpicked coffee beans, this dark roast boasts '
    //             'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
    //         [
    //           UserReview("Richard", "Powerful!", 5),
    //           UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
    //         ],
    //         [
    //           Addition(
    //               "Beans",
    //               [
    //                 AdditionDetail("Supremo", 0.00),
    //                 AdditionDetail("Yir", 5.45),
    //                 AdditionDetail("Mandheling", 8.00)
    //               ]
    //           ),
    //           Addition(
    //               "Sweetness",
    //               [
    //                 AdditionDetail("Less sugar", 0),
    //                 AdditionDetail("More sugar", 1.00),
    //               ]
    //           ),
    //         ],
    //         [
    //           Ingredient("Supremo", "assets/image/tiny.png"),
    //           Ingredient("Lemon", "assets/image/tiny.png"),
    //           Ingredient("Soda lemon", "assets/image/tiny.png"),
    //         ],
    //         true
    //     ).toMenuItemOB())
    //   ,
    //   CartItemOB()
    //     ..image = 'assets/images/coffeesample.png'
    //     ..name = 'Item 5'
    //     ..content = 'Beans: Soy | Sweetness: Less sugar'
    //     ..quantity = 5
    //     ..menuItem_id = 5
    //     ..menuItemOB.add(MenuItem(
    //         'assets/images/coffeesample.png',
    //         'I DONT SLEEP',
    //         10.00,
    //         'Coffee',
    //         'A rich and bold blend that promises to keep you wide awake and invigorated. '
    //             'Crafted from premium, handpicked coffee beans, this dark roast boasts '
    //             'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
    //         [
    //           UserReview("Richard", "Powerful!", 5),
    //           UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
    //         ],
    //         [
    //           Addition(
    //               "Beans",
    //               [
    //                 AdditionDetail("Supremo", 0.00),
    //                 AdditionDetail("Yir", 5.45),
    //                 AdditionDetail("Mandheling", 8.00)
    //               ]
    //           ),
    //           Addition(
    //               "Sweetness",
    //               [
    //                 AdditionDetail("Less sugar", 0),
    //                 AdditionDetail("More sugar", 1.00),
    //               ]
    //           ),
    //         ],
    //         [
    //           Ingredient("Supremo", "assets/image/tiny.png"),
    //           Ingredient("Lemon", "assets/image/tiny.png"),
    //           Ingredient("Soda lemon", "assets/image/tiny.png"),
    //         ],
    //         true
    //     ).toMenuItemOB())
    //   ,
    // ];
    // menuItemOB.userReviews.addAll(this.userReviews.map((review) => convertUserReview(review, menuItemOB)));

    List<CartItemOB> result = [];
    return result;
  }
}