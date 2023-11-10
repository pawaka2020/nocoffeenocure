import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/cart/packaging.dart';
import 'package:nocoffeenocure/screens/cart/paymentdetails.dart';
import 'package:nocoffeenocure/screens/cart/paymentmethods.dart';
import 'package:nocoffeenocure/screens/cart/specialrequest.dart';
import 'package:nocoffeenocure/screens/cart/voucherselection.dart';
import '../../models/cartitem.dart';
import '../../models/menuitem.dart';
import '../../models/voucher.dart';
import '../../repos/cartitem.dart';
import '../../repos/menuitem.dart';
import '../../repos/voucher.dart';
import '../../widgets/partial_divider.dart';
import '../menu_detail/menu_detail.dart';
import 'cartitemcard.dart';
import 'deliveryaddress.dart';
import 'ordersubmit.dart';

class CartScreen extends StatefulWidget {
  var cartItems = CartItemRepo().getAll();
  var vouchers = VoucherRepo().getAll();

  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //state variables
  double _finalPrice = 0.00;
  double _packagePrice = 0.00;
  List _packagePrices = [0, 0];
  List<VoucherOB> _selectedVouchers = [];
  List<int> _selectedVoucherIds = [];
  String _specialRequest = "";

  final packaging = {
    "Straw": 0.50,
    "Paperbag": 10.00,
  };

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
    newFinalPrice += _packagePrice;
    _finalPrice = newFinalPrice;
  }

  void updateSpecialRequest(String newSpecialRequest) {
    _specialRequest = newSpecialRequest;
  }

  void onSelectionChanged(int index, bool toggle, double price) {
    _packagePrice = 0;
    double _price = toggle ? price : 0;
    _packagePrices[index] = _price;
    for (var price in _packagePrices) {
      _packagePrice += price;
    }
    setState(() {
      adjustPrice();
    });
  }

  void placeOrder() {
    print("item name = ${packaging.keys.elementAt(0)}");
    print("item price = ${packaging['Straw']}");
    print("special request = $_specialRequest");
    print("final price = RM ${_finalPrice.toStringAsFixed(2)}");
  }

  void updateSelectedVouchers(List<int> _selectedVoucherIds) {

  }

  @override
  initState() {
    adjustPrice();
  }

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
                      PartialDivider(40, 10),
                      SpecialRequest(updateSpecialRequest),
                      PartialDivider(40, 10),
                      Packaging(onSelectionChanged),
                      PartialDivider(40, 10),
                      buildVoucherSelection(_selectedVoucherIds, widget.vouchers, context, updateSelectedVouchers),
                      PartialDivider(40, 10),
                      DeliveryAddress(),
                      PartialDivider(40, 10),
                      PaymentMethods(),
                      SizedBox(height: 5),
                      PaymentDetails(),
                      SizedBox(height: 5),//payment methods (wallet (topup), e-wallet, credit card, online banking)
                    ]
                  )
                ),
                //OrderSubmit(_finalPrice, placeOrder)
                buildSubmitOrder(_finalPrice, placeOrder)
              ]
            )
    );
  }
}












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




