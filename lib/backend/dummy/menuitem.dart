import '../../models/menuitem.dart';




class MenuItemDummy {
  Future<List<MenuItemOB>> get() async {
    int delay = 0;
    await Future.delayed(Duration(seconds: delay));

    String loren = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac purus vel justo dignissim cursus. Sed ullamcorper tincidunt dui, nec malesuada nulla dictum non. Nulla facilisi. Integer quis ante sit amet justo posuere luctus. Nullam lacinia libero id justo fringilla, a laoreet metus lacinia. Phasellus in purus eget nisi bibendum tristique. Sed nec sapien ut elit eleifend malesuada. Curabitur sollicitudin massa in nunc bibendum, id malesuada ex tincidunt. In hac habitasse platea dictumst. Nulla facilisi. Suspendisse potenti. Sed efficitur eget lectus in mattis. Etiam ac odio quis libero hendrerit eleifend. Vivamus nec nunc id tortor facilisis auctor. Integer nec arcu sed sapien consectetur bibendum. Curabitur aliquam bibendum lacinia. Sed ac justo nec lorem congue varius.";

    final List<MenuItem> menuItemDummy = [
      MenuItem(
          'assets/images/coffeesample.png',
          'I DONT SLEEP',
          10.00,
          'Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgaaaaaaaaaaacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ),
      MenuItem(
          'assets/images/coffeesample.png',
          'Huhu lala',
          10.00,
          'Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa. '
              'asdadads asdsads asdadsa as sadad asdsad as sads as as dsa as dsa sada'
              'sadsadsadas sad saasdsadas as sadsad as sad a as dsa as dasa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4),
            UserReview("Betty Mania", loren, 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
            Addition(
                "Cup size",
                [
                  AdditionDetail("Normal", 0),
                  AdditionDetail("Large", 3.00),
                  AdditionDetail("Deluxe", 10.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ),
      MenuItem(
          'assets/images/coffeesample.png',
          'I DONT SLEEP3',
          10.00,
          'Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ),
      MenuItem(
          'assets/images/coffeesample.png',
          'I DONT SLEEP4',

          10.00,
          'Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ),
      MenuItem(
          'assets/images/coffeesample.png',
          'I DONT SLEEP',

          10.00,
          'Non-Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ),
    ];
    // List<UserReviewOB> reviews = [
    //   UserReviewOB()..name = "Richard"..message = "Powerful!"..stars = 5,
    //   UserReviewOB()..name = "Susan Boyle"..message = "Bitter but just the shot I need for my overtime shift."..stars = 4
    // ];
    //
    // MenuItemOB test = MenuItemOB()
    //   ..imagePath = 'assets/images/coffeesample.png'
    //   ..title = 'I DONT SLEEP'
    //   ..price = 10.00
    //   ..category = 'Coffee'
    //   ..description = 'A rich and bold blend that promises to keep you wide awake and invigorated. '
    //       'Crafted from premium, handpicked coffee beans, this dark roast boasts '
    //       'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.'
    //   ..userReviews.addAll([
    //     UserReviewOB()..name = "Richard"..message = "Powerful!"..stars = 5,
    //     UserReviewOB()..name = "Susan Boyle"..message = "Bitter but just the shot I need for my overtime shift."..stars = 4
    //   ])
    //   ..additions.addAll([
    //     AdditionOB()..
    //   ])
    //;
    List<MenuItemOB> result = [
      MenuItem(
          'assets/images/coffeesample.png',
          'I DONT SLEEP',
          10.00,
          'Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yir", 5.45),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          'assets/images/coffeesample.png',
          'Huhu lala',
          10.00,
          'Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa. '
              'asdadads asdsads asdadsa as sadad asdsad as sads as as dsa as dsa sada'
              'sadsadsadas sad saasdsadas as sadsad as sad a as dsa as dasa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4),
            UserReview("Betty Mania", loren, 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
            Addition(
                "Cup size",
                [
                  AdditionDetail("Normal", 0),
                  AdditionDetail("Large", 3.00),
                  AdditionDetail("Deluxe", 10.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          'assets/images/coffeesample.png',
          'I DONT SLEEP3',
          10.00,
          'Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          'assets/images/coffeesample.png',
          'I DONT SLEEP4',

          10.00,
          'Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          'assets/images/coffeesample.png',
          'I DONT SLEEP',

          10.00,
          'Non-Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ).toMenuItemOB(),
    ];
    return result;
  }
}

class MenuItemDummyOld{
  List<MenuItem> get() {
    String loren = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac purus vel justo dignissim cursus. Sed ullamcorper tincidunt dui, nec malesuada nulla dictum non. Nulla facilisi. Integer quis ante sit amet justo posuere luctus. Nullam lacinia libero id justo fringilla, a laoreet metus lacinia. Phasellus in purus eget nisi bibendum tristique. Sed nec sapien ut elit eleifend malesuada. Curabitur sollicitudin massa in nunc bibendum, id malesuada ex tincidunt. In hac habitasse platea dictumst. Nulla facilisi. Suspendisse potenti. Sed efficitur eget lectus in mattis. Etiam ac odio quis libero hendrerit eleifend. Vivamus nec nunc id tortor facilisis auctor. Integer nec arcu sed sapien consectetur bibendum. Curabitur aliquam bibendum lacinia. Sed ac justo nec lorem congue varius.";

    final List<MenuItem> result = [
      MenuItem(
          'assets/images/coffeesample.png',
          'I DONT SLEEP',
          10.00,
          'Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ),
      MenuItem(
          'assets/images/coffeesample.png',
          'Huhu lala',
          10.00,
          'Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa. '
              'asdadads asdsads asdadsa as sadad asdsad as sads as as dsa as dsa sada'
              'sadsadsadas sad saasdsadas as sadsad as sad a as dsa as dasa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4),
            UserReview("Betty Mania", loren, 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
            Addition(
                "Cup size",
                [
                  AdditionDetail("Normal", 0),
                  AdditionDetail("Large", 3.00),
                  AdditionDetail("Deluxe", 10.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ),
      MenuItem(
          'assets/images/coffeesample.png',
          'I DONT SLEEP3',
          10.00,
          'Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ),
      MenuItem(
          'assets/images/coffeesample.png',
          'I DONT SLEEP4',

          10.00,
          'Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ),
      MenuItem(
          'assets/images/coffeesample.png',
          'I DONT SLEEP',

          10.00,
          'Non-Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
          [
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
          ],
          [
            Addition(
                "Beans",
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo", "assets/image/tiny.png"),
            Ingredient("Lemon", "assets/image/tiny.png"),
            Ingredient("Soda lemon", "assets/image/tiny.png"),
          ],
          true
      ),
    ];
    return result;
  }
}