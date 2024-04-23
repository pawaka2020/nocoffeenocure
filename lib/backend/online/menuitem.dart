import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../../models/menuitem.dart';
import 'dart:convert';
import '../../common.dart';
import 'package:http/http.dart' as http;

//import '../dummy/menuitem.dart';

class MenuItemOnline {

  List<UserReviewOB> getUserReviews(Map<String, dynamic> json) {
    List<UserReviewOB> userReviews = [];
    if (json['userreviews'] != null) {
      for (var reviewJson in json['userreviews']) {
        userReviews.add(UserReviewOB()
          ..name = reviewJson['name']
          ..message = reviewJson['message']
          ..stars = reviewJson['stars']
        );
      }
    }
    return userReviews;
  }

  List<AdditionOB> getAdditions(Map<String, dynamic> json) {
    List<AdditionOB> additions = [];
    if (json['additions'] != null) {
      List<dynamic> additionJsonList = json['additions'];
      for (var additionJson in additionJsonList) {
        AdditionOB addition = AdditionOB()
          ..title = additionJson['title']
          ..selectedPrice = additionJson['selectedPrice'].toDouble()// I got error int is not a subtype of Double
          ..selectedIndex = additionJson['selectedIndex']
          ;

        if (additionJson['addition_details'] != null) {
          List<dynamic> detailJsonList = additionJson['addition_details'];
          for (var detailJson in detailJsonList) {
            AdditionDetailOB detail = AdditionDetailOB()
              ..name = detailJson['name']
              ..price = detailJson['price'].toDouble()
            ;
            addition.additionDetails.add(detail);
          }
        }
        additions.add(addition);
      }
    }
    return additions;
  }

  List<IngredientOB> getIngredients(Map<String, dynamic> json) {
    List<IngredientOB> ingredients = [];
    if (json['ingredients'] != null) {
      List<dynamic> ingredientJsonList = json['ingredients'];
      for (var ingredientJson in ingredientJsonList) {
        IngredientOB ingredient = IngredientOB()
          ..name = ingredientJson['name'];
        ingredients.add(ingredient);
      }
    }
    return ingredients;
  }

  Future<List<MenuItemOB>> get() async {
    try {
      final response = await http.get(Uri.parse(onlineBackendURL + 'get_menuitems'));
      if (response.statusCode == 200) {
        Iterable menuitemJson = json.decode(response.body);
        List<MenuItemOB> menuitemList = [];
        for (var json in menuitemJson) {
          MenuItemOB menuitem = MenuItemOB()
            //..imagePath = await getImage(json['imagepath'],'menuitem')
            ..imagePath = onlineBackendURL + json['imagepath']
            ..title = json['title']
            ..price = json['price'].toDouble()
            ..category = json['category']
            ..description = json['description']
            ..available = json['available']
          ;
          menuitem.userReviews.addAll(getUserReviews(json));
          menuitem.additions.addAll(getAdditions(json));
          menuitem.ingredients.addAll(getIngredients(json));

          menuitemList.add(menuitem);
        }
        menuitemLoaded = true;
        //print("asdsaddsdsadAAAAA");
        return menuitemList;
        //return MenuItemDummy().get();
      }
      else {
        menuitemLoaded = false;
        throw Exception('Failed to load menuitem: ${response.statusCode}');
      }
    }
    catch (e) {
      print('Error fetching menuitem: $e. Consider turning on wifi and matching ip address to the connection the backend is hosted on');
      menuitemLoaded = false;
      return [];
    }
  }
}