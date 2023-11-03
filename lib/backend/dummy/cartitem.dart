import '../../models/cartitem.dart';

class CartItemDummy {
  Future<List<CartItemOB>> get() async {
    int delay = 0;
    await Future.delayed(Duration(seconds: delay));

    List<CartItemOB> result = [
      CartItemOB()
        ..image = 'assets/images/coffeesample.png'
        ..name = 'Item 1'
        ..content = 'Beans: Supremo | Sweetness: Less sugar | Cup size: Regular'
        ..quantity = 3
        ..menuItem_id = 2,
      CartItemOB()
        ..image = 'assets/images/coffeesample.png'
        ..name = 'Item 2'
        ..content = 'Beans: Soy | Sweetness: Less sugar'
        ..quantity = 5
        ..menuItem_id = 5,
      CartItemOB()
        ..image = 'assets/images/coffeesample.png'
        ..name = 'Item 3'
        ..content = 'Beans: Soy | Sweetness: Less sugar'
        ..quantity = 5
        ..menuItem_id = 5,
      CartItemOB()
        ..image = 'assets/images/coffeesample.png'
        ..name = 'Item 4'
        ..content = 'Beans: Soy | Sweetness: Less sugar'
        ..quantity = 5
        ..menuItem_id = 5,
      CartItemOB()
        ..image = 'assets/images/coffeesample.png'
        ..name = 'Item 5'
        ..content = 'Beans: Soy | Sweetness: Less sugar'
        ..quantity = 5
        ..menuItem_id = 5,
    ];
    return result;
  }
}