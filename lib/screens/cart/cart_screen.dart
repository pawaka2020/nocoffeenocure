import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/cart/packaging.dart';
import 'package:nocoffeenocure/screens/cart/paymentdetails.dart';
import 'package:nocoffeenocure/screens/cart/paymentmethods.dart';
import 'package:nocoffeenocure/screens/cart/specialrequest.dart';
import 'package:nocoffeenocure/screens/cart/voucherselection.dart';
import '../../models/cartitem.dart';
import '../../repos/cartitem.dart';
import '../../widgets/partial_divider.dart';
import 'cartitemcard.dart';
import 'deliveryaddress.dart';
import 'ordersubmit.dart';
//TODO: maybe change CartScreen to a stateless widget.

class CartScreen extends StatelessWidget {
  //bool empty = false;
  var cartItems = CartItemRepo().getAll();


  @override
  Widget build(BuildContext context) {
    if (cartItems.isEmpty) {
      return placeholder2;
    }
    else {
      return CartDisplay(cartItems);
    }
    //return CartDisplay(cartItems);
  }
}

class CartDisplay extends StatefulWidget {

  var cartItems;

  CartDisplay(this.cartItems);

  @override
  State<StatefulWidget> createState() => _CartDisplayState();
}

class _CartDisplayState extends State<CartDisplay> {
  //state variables
  double _finalPrice = 10.00;
  late var _cartItems;

  @override
  void initState() {
    _cartItems = widget.cartItems;
  }

  Future<void> deleteCartItem(BuildContext context, int id) async {
    bool confirmation = await showDeleteConfirmationDialog(context);
    if (confirmation) {
      CartItemRepo().remove(id);
      setState(() {
        widget.cartItems = CartItemRepo().getAll();
      });
    }
  }

  void adjustPrice() {
    setState(() {
      _finalPrice += 20.00;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ...widget.cartItems.map((item) => CartItemCard(item, deleteCartItem)),
                  ],
                ),
              ),
              OrderSubmit(_finalPrice, adjustPrice)
            ]
        )
    );
  }
}

Center placeholder = Center(
    child: Text(
      'Cart page',
      style: TextStyle(fontSize: 24),
    )
);

Center placeholder2 = Center(
    child: Text(
      'Cart is empty',
      style: TextStyle(fontSize: 24),
    )
);

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




