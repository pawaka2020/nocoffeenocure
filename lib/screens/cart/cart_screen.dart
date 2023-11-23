import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/cart/packaging.dart';
import 'package:nocoffeenocure/screens/cart/paymentdetails.dart';
import 'package:nocoffeenocure/screens/cart/paymentmethods.dart';
import 'package:nocoffeenocure/screens/cart/phone.dart';
import 'package:nocoffeenocure/screens/cart/specialrequest.dart';
import 'package:nocoffeenocure/screens/cart/voucherselection.dart';
import '../../common.dart';
import '../../models/cartitem.dart';
import '../../models/menuitem.dart';
import '../../models/voucher.dart';
import '../../provider/cart_count_notifier.dart';
import '../../repos/cartitem.dart';
import '../../repos/menuitem.dart';
import '../../repos/voucher.dart';
import '../../widgets/partial_divider.dart';
import '../menu_detail/menu_detail.dart';
import '../selectunusedvoucher/selectunusedvoucher.dart';
import 'cartitemcard.dart';
import 'deliveryaddress.dart';
import 'ordersubmit.dart';

///adasd
class Price {
  double amount = 0.0;
  double sst = 0.0;
  double voucherDeduction = 0.0;
  double subtotal = 0.0;
  double deliveryFee = 0.0;
  double roundingAdjustment = 0.0;
  double total = 0.0;
  Price();
}

class CartScreen extends StatefulWidget {
  void Function(int) updateCartCount;
  void Function() setTracking;
  void Function(int) changePage;
  bool tracking;
  CartScreen(this.updateCartCount, this.setTracking, this.changePage, this.tracking);
  var cartItems = CartItemRepo().getAll();
  var vouchers = VoucherRepo().getAll();
  //var vouchers = VoucherRepo().getAllFromUser();

  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //state variables
  double _finalPrice = 0.00;
  double _packagePrice = 0.00;
  List _packagePrices = [0, 0];
  List<VoucherOB> _usedList = [];
  List<int> _selectedVoucherIds = [];
  double _voucherDeduction = 0;
  String _specialRequest = "";

  double _tax = 0.06;
  double _deliveryFee = 4.00;
  double _subtotal = 0;
  double _roundingAdj = 0;

  Price price = Price();

  final packaging = {
    "Straw": 0.50,
    "Paperbag": 10.00,
  };

  void adjustPrice()  {
    //calculate amount
    double cartPrice = 0;
    for (var cartItem in widget.cartItems) {
      cartPrice += cartItem.price;
    }
    cartPrice += _packagePrice;
    price.amount = cartPrice;

    //calculate sst
    //for now, just set it to zero becase I'm not sure if prices on menu exclusive or inclusive of tax.
    //price.sst = price.amount * _tax;
    price.sst = 0;

    //calculate vouchers
    for (var voucher in _usedList) {
      price.voucherDeduction -= voucher.priceDeduct!;
      price.voucherDeduction -= (price.amount - (voucher.priceDiscount! * price.amount));
    }
    price.voucherDeduction *= -1;

    //calculate subtotal
    price.subtotal = price.amount + price.sst - price.voucherDeduction;

    //calculate delivery fee
    price.deliveryFee = _deliveryFee;

    //calculate rounding adjustment

    //calculate final price
    _finalPrice = price.amount;
    price.total = price.subtotal + price.deliveryFee;
  }

  //state functions
  Future<void> deleteCartItem(int id) async {
    bool confirmation = await showDeleteConfirmationDialog(
        context, 'Confirm Deletion', 'Are you sure you want to delete this item?');
    if (confirmation) {
      setState(() {
        CartItemRepo().remove(id);
        widget.cartItems = CartItemRepo().getAll();
        widget.updateCartCount(-1);
        printToast("Item removed from cart");
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
      builder: (context) => MenuDetailsPage(cartItem.menuItemOB[0].toMenuItem(), true, cartItem.quantity!, cartItem.id, widget.updateCartCount),
    ));

    if (updatedCartItem != null){
      setState(() {
        CartItemRepo().box.put(updatedCartItem);
        widget.cartItems = CartItemRepo().getAll();
        adjustPrice();
        printToast("Cart item updated");
      });
    }
    else
      print("Error: Cart item not received");
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
    //addOrderItem();
    if (widget.tracking == false) {
      widget.setTracking();
      //delete all cart items
      int length = widget.cartItems.length;
      widget.updateCartCount(length * -1);
      CartItemRepo().box.removeAll();
      //setState(() {});
    }
    else printToast("Error: Order already exists");
  }

  void addVoucher() async {
    final activated = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SelectUnusedVoucherScreen(widget.vouchers, _selectedVoucherIds, context),
    ));
    if (activated) {
      setState(() {
        _usedList = VoucherRepo()
            .getFromIdList(widget.vouchers, _selectedVoucherIds);
      });
    }
    else print("Error in adding new voucher");
  }

  void removeVoucher(int id) async {
    bool confirmation = await showDeleteConfirmationDialog(
        context, 'Confirm Deletion', 'Are you sure you want to remove this voucher?');
    if (confirmation) {
      setState(() {
        _selectedVoucherIds.remove(id);
        _usedList = VoucherRepo()
            .getFromIdList(widget.vouchers, _selectedVoucherIds);
      });
    }
  }

  @override
  initState() {
    adjustPrice();
  }

  @override
  Widget build(BuildContext context) {
    _usedList = VoucherRepo()
        .getFromIdList(widget.vouchers, _selectedVoucherIds);
    adjustPrice();
    if (widget.cartItems.isEmpty) {
      return Center(
        child: Text('Cart is Empty'),
      );
    }
    else {
      return Column(
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
                buildVoucherSelection(_usedList, _selectedVoucherIds, widget.vouchers, context, addVoucher, removeVoucher),
                PartialDivider(40, 10),
                DeliveryAddress(),
                PartialDivider(40, 10),
                buildPhoneNumber(),
                PartialDivider(40, 10),
                PaymentMethods(),
                SizedBox(height: 5),
                buildPaymentDetails(price, context),
                SizedBox(height: 5),
              ]
            )
          ),
          buildSubmitOrder(price.total, placeOrder)
        ]
      );
    }
  }
}

Future<bool> showDeleteConfirmationDialog(BuildContext context, String text1, String text2) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(text1),
        content: Text(text2),
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