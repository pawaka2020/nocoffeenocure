import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/cart/packaging.dart';
import 'package:nocoffeenocure/screens/cart/paymentdetails.dart';
import 'package:nocoffeenocure/screens/cart/paymentmethods.dart';
import 'package:nocoffeenocure/screens/cart/specialrequest.dart';
import 'package:nocoffeenocure/screens/cart/voucherselection.dart';
import '../../models/cartitem.dart';
import '../../models/menuitem.dart';
import '../../repos/cartitem.dart';
import '../../repos/menuitem.dart';
import '../../widgets/partial_divider.dart';
import '../menu_detail/menu_detail.dart';
import 'cartitemcard.dart';
import 'deliveryaddress.dart';
import 'ordersubmit.dart';

class CartScreen extends StatefulWidget {
  var cartItems = CartItemRepo().getAll();

  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //state variables
  double _finalPrice = 0.00;

  //state functions
  Future<void> deleteCartItem(BuildContext context, int id) async {
    bool confirmation = await showDeleteConfirmationDialog(context);
    if (confirmation) {
      CartItemRepo().remove(id);
      setState(() {
        widget.cartItems = CartItemRepo().getAll();
        adjustPrice();
      });
    }
  }

  Future<void> editCartItem(BuildContext context, int id) async {
    List<CartItemOB> cartItems = widget.cartItems;
    int targetId = id;

    CartItemOB? cartItem = cartItems.firstWhere(
          (item) => item.id == targetId,
      orElse: () => CartItemOB(),
    );

    if (cartItem != null) {
      print('Found item: ${cartItem.menuItemOB[0].title}');
    }
    else {
      print('Item with id $targetId not found.');
    }
    final updatedCartItem = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MenuDetailsPage(cartItem.menuItemOB[0].toMenuItem(), true, cartItem.quantity!, cartItem.id),
    ));

    if (updatedCartItem != null){
      CartItemRepo().box.put(updatedCartItem);
      setState(() {
        widget.cartItems = CartItemRepo().getAll();
        adjustPrice();
      });
    }
    else
      print("Error: Cart item not received");
  }

  void adjustPrice() {

    double newFinalPrice = 0;
    for (var cartItem in widget.cartItems) {
      newFinalPrice += cartItem.price;
    }
    _finalPrice = newFinalPrice;
  }

  //this doesn't get called after editing cart item
  @override
  initState() {
    adjustPrice();
  }

  void placeOrder() {}

  //this doesn't get called after editing cart item either.
  @override
  Widget build(BuildContext context) {
    adjustPrice();

    return Scaffold(
      body: widget.cartItems.isEmpty
          ? Center(
              child: Text('Cart is Empty'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ...widget.cartItems.map((item) => CartItemCard(item, deleteCartItem, editCartItem)),
                    ]
                  )
                ),
                OrderSubmit(_finalPrice, placeOrder)
              ]
            )
    );
  }
}



// class _CartDisplayState extends State<CartDisplay> {
//   //state variables
//   late double _finalPrice;
//   late String _specialRequest;
//   late List<CartItemOB> _cartItems;
//
//   //use constructor to set starting values for state variables
//   _CartDisplayState() {
//     _finalPrice = 10.00;
//     _specialRequest = '';
//     _cartItems = widget.cartItems;
//   }
//
//   //state functions
//   void deleteCartItem(int id) {
//     CartItemRepo().remove(id);
//     setState(() {
//       _cartItems = CartItemRepo().getAll();
//     });
//   }
//
//   void adjustPrice() {
//     setState(() {
//       _finalPrice += 20.00;
//     });
//   }
//
//   void updateSpecialRequest(String newText) {
//     setState(() {
//       _specialRequest = newText;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//             children: [
//               Expanded(
//                 child: ListView(
//                   children: [
//                     //create as many CartItemCart() widgets as elements of 'cartItems'
//                     //each CartItemCard() widget uses fields from each respective element of 'cartItems'
//                     ...widget.cartItems.map((item) => CartItemCard(item)),
//                     PartialDivider(40, 10),
//                     SpecialRequest(
//                       specialRequest: _specialRequest,
//                       onSpecialRequestChanged: updateSpecialRequest,
//                     ),
//                     PartialDivider(40, 10),//special requests (textfield)
//                     Packaging(),
//                     PartialDivider(40, 10),//packaging (need straws, need paper bag, etc)
//                     PaymentMethods(),
//                     PartialDivider(40, 10),
//                     VoucherSelection(),
//                     PartialDivider(40, 10),
//                     DeliveryAddress(),
//                     PaymentDetails(),
//                     SizedBox(height: 5),//payment methods (wallet (topup), e-wallet, credit card, online banking)
//                   ],
//                 ),
//               ),
//               OrderSubmit(_finalPrice, adjustPrice)
//             ]
//         )
//     );
//   }
// }

Future<bool> showDeleteConfirmationDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Confirm Deletion'),
        content: Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(false); // Return false to indicate cancellation
            },
          ),
          TextButton(
            child: Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop(true); // Return true to indicate deletion confirmation
            },
          ),
        ],
      );
    },
  );
}




