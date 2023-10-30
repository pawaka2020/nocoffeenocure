// import '../../models/menuitem.dart';
// import '../../repos/menuitem.dart';
//
// class MenuItemDummy {
//   Future<List<MenuItem>> get() async {
//     int delay = 3;
//
//     await Future.delayed(Duration(seconds: delay));
//     List<MenuItem> result = [
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
//                 [
//                   AdditionDetail("Supremo", 0.00),
//                   AdditionDetail("Yirgacheffe", 5.30),
//                   AdditionDetail("Mandheling", 8.00)
//                 ]
//             ),
//             Addition(
//                 "Sweetness",
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
//             UserReview("Betty Mania", "Sasdas ad sad asd ", 4)
//           ],
//           [
//             Addition(
//                 "Beans",
//                 [
//                   AdditionDetail("Supremo", 0.00),
//                   AdditionDetail("Yirgacheffe", 5.30),
//                   AdditionDetail("Mandheling", 8.00)
//                 ]
//             ),
//             Addition(
//                 "Sweetness",
//                 [
//                   AdditionDetail("Less sugar", 0),
//                   AdditionDetail("More sugar", 1.00),
//                 ]
//             ),
//             Addition(
//                 "Cup size",
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
//                 [
//                   AdditionDetail("Supremo", 0.00),
//                   AdditionDetail("Yirgacheffe", 5.30),
//                   AdditionDetail("Mandheling", 8.00)
//                 ]
//             ),
//             Addition(
//                 "Sweetness",
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
//                 [
//                   AdditionDetail("Supremo", 0.00),
//                   AdditionDetail("Yirgacheffe", 5.30),
//                   AdditionDetail("Mandheling", 8.00)
//                 ]
//             ),
//             Addition(
//                 "Sweetness",
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
//                 [
//                   AdditionDetail("Supremo", 0.00),
//                   AdditionDetail("Yirgacheffe", 5.30),
//                   AdditionDetail("Mandheling", 8.00)
//                 ]
//             ),
//             Addition(
//                 "Sweetness",
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
//
//
