import '../../common.dart';
import '../../models/menuitem.dart';

class MenuItemDummy {
  Future<List<MenuItemOB>> get() async {
    int delay = 0;
    await Future.delayed(Duration(seconds: delay));

    String loren = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac purus vel justo dignissim cursus. Sed ullamcorper tincidunt dui, nec malesuada nulla dictum non. Nulla facilisi. Integer quis ante sit amet justo posuere luctus. Nullam lacinia libero id justo fringilla, a laoreet metus lacinia. Phasellus in purus eget nisi bibendum tristique. Sed nec sapien ut elit eleifend malesuada. Curabitur sollicitudin massa in nunc bibendum, id malesuada ex tincidunt. In hac habitasse platea dictumst. Nulla facilisi. Suspendisse potenti. Sed efficitur eget lectus in mattis. Etiam ac odio quis libero hendrerit eleifend. Vivamus nec nunc id tortor facilisis auctor. Integer nec arcu sed sapien consectetur bibendum. Curabitur aliquam bibendum lacinia. Sed ac justo nec lorem congue varius.";

    List<MenuItemOB> result = [
      MenuItem(
          await copyAssetToStorage('assets/images/coffeesample.png'),
          'Coffee 1',
          10.00,
          'Coffee',
          'A rich and bold blend that promises to keep you wide awake and invigorated. '
              'Crafted from premium, handpicked coffee beans, this dark roast boasts '
              'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
          [
            //INSERT INTO Order (customer_id, order_date) VALUES (1, '2024-02-19');
            //Insert into
            UserReview("Richard", "Powerful!", 5),
            UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
          ],
          [
            Addition(
                "Beans",
                0,
                0,
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yir", 5.45),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                0,
                0,
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo"),
            Ingredient("Lemon"),
            Ingredient("Soda lemon"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          await copyAssetToStorage('assets/images/coffeesample.png'),
          'Coffee 2',
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
                0,
                0,
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                0,
                0,
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
            Addition(
                "Cup size",
                0,
                0,
                [
                  AdditionDetail("Normal", 0),
                  AdditionDetail("Large", 3.00),
                  AdditionDetail("Deluxe", 10.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo"),
            Ingredient("Lemon"),
            Ingredient("Soda lemon"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          await copyAssetToStorage('assets/images/coffeesample.png'),
          'Coffee 3',
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
                0,
                0,
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                0,
                0,
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo"),
            Ingredient("Lemon"),
            Ingredient("Soda lemon"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          await copyAssetToStorage('assets/images/coffeesample.png'),
          'Coffee 4',
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
                0,
                0,
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                0,
                0,
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo"),
            Ingredient("Lemon"),
            Ingredient("Soda lemon"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          await copyAssetToStorage('assets/images/coffeesample.png'),
          'Non-Coffee 1',
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
                0,
                0,
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                0,
                0,
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo"),
            Ingredient("Lemon"),
            Ingredient("Soda lemon"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          await copyAssetToStorage('assets/images/coffeesample.png'),
          'Appetizer 1',
          10.00,
          'Appetizers',
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
                0,
                0,
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                0,
                0,
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo"),
            Ingredient("Lemon"),
            Ingredient("Soda lemon"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          await copyAssetToStorage('assets/images/coffeesample.png'),
          'Appetizer 2',

          10.00,
          'Appetizers',
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
                0,
                0,
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                0,
                0,
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo"),
            Ingredient("Lemon"),
            Ingredient("Soda lemon"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          await copyAssetToStorage('assets/images/coffeesample.png'),
          'Snack 1',

          10.00,
          'Snacks',
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
                0,
                0,
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                0,
                0,
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo"),
            Ingredient("Lemon"),
            Ingredient("Soda lemon"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          await copyAssetToStorage('assets/images/coffeesample.png'),
          'Snack 2',

          10.00,
          'Snacks',
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
                0,
                0,
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                0,
                0,
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo"),
            Ingredient("Lemon"),
            Ingredient("Soda lemon"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          await copyAssetToStorage('assets/images/coffeesample.png'),
          'Snack 3',

          10.00,
          'Snacks',
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
                0,
                0,
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                0,
                0,
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo"),
            Ingredient("Lemon"),
            Ingredient("Soda lemon"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          await copyAssetToStorage('assets/images/coffeesample.png'),
          'Food 1',
          10.00,
          'Meals',
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
                0,
                0,
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                0,
                0,
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo"),
            Ingredient("Lemon"),
            Ingredient("Soda lemon"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          await copyAssetToStorage('assets/images/coffeesample.png'),
          'Food 2',
          10.00,
          'Meals',
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
                0,
                0,
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                0,
                0,
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo"),
            Ingredient("Lemon"),
            Ingredient("Soda lemon"),
          ],
          true
      ).toMenuItemOB(),
      MenuItem(
          await copyAssetToStorage('assets/images/coffeesample.png'),
          'Food 3',

          10.00,
          'Meals',
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
                0,
                0,
                [
                  AdditionDetail("Supremo", 0.00),
                  AdditionDetail("Yirgacheffe", 5.30),
                  AdditionDetail("Mandheling", 8.00)
                ]
            ),
            Addition(
                "Sweetness",
                0,
                0,
                [
                  AdditionDetail("Less sugar", 0),
                  AdditionDetail("More sugar", 1.00),
                ]
            ),
          ],
          [
            Ingredient("Supremo"),
            Ingredient("Lemon"),
            Ingredient("Soda lemon"),
          ],
          true
      ).toMenuItemOB(),
    ];
    //MenuItemOB asdas = MenuItemOB()..additions = AdditionOB();
    return result;
  }
}

// class MenuItemDummyOld {
//   List<MenuItem> get() {
//     String loren = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac purus vel justo dignissim cursus. Sed ullamcorper tincidunt dui, nec malesuada nulla dictum non. Nulla facilisi. Integer quis ante sit amet justo posuere luctus. Nullam lacinia libero id justo fringilla, a laoreet metus lacinia. Phasellus in purus eget nisi bibendum tristique. Sed nec sapien ut elit eleifend malesuada. Curabitur sollicitudin massa in nunc bibendum, id malesuada ex tincidunt. In hac habitasse platea dictumst. Nulla facilisi. Suspendisse potenti. Sed efficitur eget lectus in mattis. Etiam ac odio quis libero hendrerit eleifend. Vivamus nec nunc id tortor facilisis auctor. Integer nec arcu sed sapien consectetur bibendum. Curabitur aliquam bibendum lacinia. Sed ac justo nec lorem congue varius.";
//
//     final List<MenuItem> result = [
//       MenuItem(
//           'assets/images/coffeesample.png',
//           'I DONT SLEEP',
//           10.00,
//           'Coffee',
//           'A rich and bold blend that promises to keep you wide awake and invigorated. '
//               'Crafted from premium, handpicked coffee beans, this dark roast boasts '
//               'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
//           [
//             UserReview("Richard", "Powerful!", 5),
//             UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
//           ],
//           [
//             Addition(
//                 "Beans",
//                 0,
//                 0,
//                 [
//                   AdditionDetail("Supremo", 0.00),
//                   AdditionDetail("Yirgacheffe", 5.30),
//                   AdditionDetail("Mandheling", 8.00)
//                 ]
//             ),
//             Addition(
//                 "Sweetness",
//                 0,
//                 0,
//                 [
//                   AdditionDetail("Less sugar", 0),
//                   AdditionDetail("More sugar", 1.00),
//                 ]
//             ),
//           ],
//           [
//             Ingredient("Supremo", "assets/image/tiny.png"),
//             Ingredient("Lemon", "assets/image/tiny.png"),
//             Ingredient("Soda lemon", "assets/image/tiny.png"),
//           ],
//           true
//       ),
//       MenuItem(
//           'assets/images/coffeesample.png',
//           'Huhu lala',
//           10.00,
//           'Coffee',
//           'A rich and bold blend that promises to keep you wide awake and invigorated. '
//               'Crafted from premium, handpicked coffee beans, this dark roast boasts '
//               'a robust flavor with deep, earthy undertones and a subtle hint of cocoa. '
//               'asdadads asdsads asdadsa as sadad asdsad as sads as as dsa as dsa sada'
//               'sadsadsadas sad saasdsadas as sadsad as sad a as dsa as dasa.',
//           [
//             UserReview("Richard", "Powerful!", 5),
//             UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4),
//             UserReview("Betty Mania", loren, 4)
//           ],
//           [
//             Addition(
//                 "Beans",
//                 0,
//                 0,
//                 [
//                   AdditionDetail("Supremo", 0.00),
//                   AdditionDetail("Yirgacheffe", 5.30),
//                   AdditionDetail("Mandheling", 8.00)
//                 ]
//             ),
//             Addition(
//                 "Sweetness",
//                 0,
//                 0,
//                 [
//                   AdditionDetail("Less sugar", 0),
//                   AdditionDetail("More sugar", 1.00),
//                 ]
//             ),
//             Addition(
//                 "Cup size",
//                 0,
//                 0,
//                 [
//                   AdditionDetail("Normal", 0),
//                   AdditionDetail("Large", 3.00),
//                   AdditionDetail("Deluxe", 10.00),
//                 ]
//             ),
//           ],
//           [
//             Ingredient("Supremo", "assets/image/tiny.png"),
//             Ingredient("Lemon", "assets/image/tiny.png"),
//             Ingredient("Soda lemon", "assets/image/tiny.png"),
//           ],
//           true
//       ),
//       MenuItem(
//           'assets/images/coffeesample.png',
//           'I DONT SLEEP3',
//           10.00,
//           'Coffee',
//           'A rich and bold blend that promises to keep you wide awake and invigorated. '
//               'Crafted from premium, handpicked coffee beans, this dark roast boasts '
//               'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
//           [
//             UserReview("Richard", "Powerful!", 5),
//             UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
//           ],
//           [
//             Addition(
//                 "Beans",
//                 0,
//                 0,
//                 [
//                   AdditionDetail("Supremo", 0.00),
//                   AdditionDetail("Yirgacheffe", 5.30),
//                   AdditionDetail("Mandheling", 8.00)
//                 ]
//             ),
//             Addition(
//                 "Sweetness",
//                 0,
//                 0,
//                 [
//                   AdditionDetail("Less sugar", 0),
//                   AdditionDetail("More sugar", 1.00),
//                 ]
//             ),
//           ],
//           [
//             Ingredient("Supremo", "assets/image/tiny.png"),
//             Ingredient("Lemon", "assets/image/tiny.png"),
//             Ingredient("Soda lemon", "assets/image/tiny.png"),
//           ],
//           true
//       ),
//       MenuItem(
//           'assets/images/coffeesample.png',
//           'I DONT SLEEP4',
//
//           10.00,
//           'Coffee',
//           'A rich and bold blend that promises to keep you wide awake and invigorated. '
//               'Crafted from premium, handpicked coffee beans, this dark roast boasts '
//               'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
//           [
//             UserReview("Richard", "Powerful!", 5),
//             UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
//           ],
//           [
//             Addition(
//                 "Beans",
//                 0,
//                 0,
//                 [
//                   AdditionDetail("Supremo", 0.00),
//                   AdditionDetail("Yirgacheffe", 5.30),
//                   AdditionDetail("Mandheling", 8.00)
//                 ]
//             ),
//             Addition(
//                 "Sweetness",
//                 0,
//                 0,
//                 [
//                   AdditionDetail("Less sugar", 0),
//                   AdditionDetail("More sugar", 1.00),
//                 ]
//             ),
//           ],
//           [
//             Ingredient("Supremo", "assets/image/tiny.png"),
//             Ingredient("Lemon", "assets/image/tiny.png"),
//             Ingredient("Soda lemon", "assets/image/tiny.png"),
//           ],
//           true
//       ),
//       MenuItem(
//           'assets/images/coffeesample.png',
//           'I DONT SLEEP',
//
//           10.00,
//           'Non-Coffee',
//           'A rich and bold blend that promises to keep you wide awake and invigorated. '
//               'Crafted from premium, handpicked coffee beans, this dark roast boasts '
//               'a robust flavor with deep, earthy undertones and a subtle hint of cocoa.',
//           [
//             UserReview("Richard", "Powerful!", 5),
//             UserReview("Susan Boyle", "Bitter but just the shot I need for my overtime shift.", 4)
//           ],
//           [
//             Addition(
//                 "Beans",
//                 0,
//                 0,
//                 [
//                   AdditionDetail("Supremo", 0.00),
//                   AdditionDetail("Yirgacheffe", 5.30),
//                   AdditionDetail("Mandheling", 8.00)
//                 ]
//             ),
//             Addition(
//                 "Sweetness",
//                 0,
//                 0,
//                 [
//                   AdditionDetail("Less sugar", 0),
//                   AdditionDetail("More sugar", 1.00),
//                 ]
//             ),
//           ],
//           [
//             Ingredient("Supremo", "assets/image/tiny.png"),
//             Ingredient("Lemon", "assets/image/tiny.png"),
//             Ingredient("Soda lemon", "assets/image/tiny.png"),
//           ],
//           true
//       ),
//     ];
//     return result;
//   }
// }