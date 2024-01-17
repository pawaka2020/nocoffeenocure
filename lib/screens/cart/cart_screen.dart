import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/cart/packaging.dart';
import 'package:nocoffeenocure/screens/cart/paymentdetails.dart';
import 'package:nocoffeenocure/screens/cart/paymentmethods.dart';
import 'package:nocoffeenocure/screens/cart/phone.dart';
import 'package:nocoffeenocure/screens/cart/specialrequest.dart';
import 'package:nocoffeenocure/screens/cart/voucherselection.dart';
import '../../common.dart';
import '../../main.dart';
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
import 'addorder.dart';
import 'cartitemcard.dart';
import 'checkordererrors.dart';
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
  double appWalletDiscount = 0.0;
  double total = 0.0;
  Price();
}

class CartScreen extends StatefulWidget {
  void Function(int) updateCartCount;
  void Function(int) placeOrder;
  bool tracking;
  //void Function(bool, int) setTracking;
  CartScreen(this.updateCartCount, this.placeOrder,  this.tracking);
  var cartItems = CartItemRepo().getAll();
  var vouchers = VoucherRepo().getAll();

  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class Package {
  late String name;
  late double price;
  bool selected = false;

  Package(name, price);
}

class _CartScreenState extends State<CartScreen> {
  //state variables
  double _finalPrice = 0.00;
  double _packagePrice = 0.00;
  String _packageString = '';
  List<bool> _packageToggle = [false, false];
  List<VoucherOB> _usedList = [];
  List<int> _selectedVoucherIds = [];
  double _voucherDeduction = 0;
  String _specialRequest = "";
  String _phoneNumber = '';
  String _address = singletonUser.setDefaultAddress ? singletonUser.address! : '';

  bool _onsitePickup = false;
  double _tax = 0.06;
  double _deliveryFee = 4.00;
  double _subtotal = 0;
  double _roundingAdj = 0;
  String _paymentMethod = 'NCNC Wallet';
  Price price = Price();

  void adjustPrice() {
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
    if(price.voucherDeduction == -0) price.voucherDeduction = 0;

    //calculate subtotal
    price.subtotal = price.amount + price.sst - price.voucherDeduction;

    //calculate delivery fee
    price.deliveryFee = _deliveryFee;

    //calculate final app wallet adjustment
    if (_paymentMethod == 'NCNC Wallet') {
      price.appWalletDiscount = (price.subtotal + price.deliveryFee) * 0.20;
    }
    else {
      price.appWalletDiscount = 0;
    }

    //calculate final price
    _finalPrice = price.amount;
    price.total = (price.subtotal + price.deliveryFee) - price.appWalletDiscount;
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

    if (updatedCartItem != null) {
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

  //special requests
  void updateSpecialRequest(String newSpecialRequest) {
    _specialRequest = newSpecialRequest;
  }

  void updatePhoneNumber(String phoneNumber) {
    // setState(() {
    //   _phoneNumber = phoneNumber;
    //   adjustPrice();
    // });
    _phoneNumber = phoneNumber;
  }

  void updateAddress(String address) {//
    setState(() {
      _address = address;
    });
    //_address = address;
  }

  void updateOnsitePickup(bool onsitePickup) {
    _onsitePickup = onsitePickup;
  }

  void updatePackageDetails(double packagePrice, String packageString, int index) {
    _packagePrice = packagePrice;
    _packageString = packageString;
    _packageToggle[index] = !_packageToggle[index];
    setState(() {
      adjustPrice();
    });
  }

  void updatePaymentMethod(String paymentMethod) {
    setState(() {
      _paymentMethod = paymentMethod;
      adjustPrice();
    });
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

  Future<void> placeOrder() async {
    if (widget.tracking == true) {
      printToast("Error: Order already exists");
      return ;
    }
    if (checkOrderErrors(widget.tracking)) {
      addOrder(_selectedVoucherIds, widget.cartItems, _specialRequest,
          _packageString, _address, _onsitePickup, _phoneNumber, _paymentMethod, price);
      _selectedVoucherIds = [];
      //first method
      widget.placeOrder(widget.cartItems.length);
      //second method
      // widget.setTracking(true, 3);
      // widget.updateCartCount(widget.cartItems.length * -1);
      // CartItemRepo().box.removeAll();
      // printToast("Order placed");
    };
  }

  @override
  Widget build(BuildContext context) {
    widget.vouchers = VoucherRepo().getAll(); //this one
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
                buildSpecialRequest(_specialRequest, updateSpecialRequest),
                SizedBox(height: 10),
                PartialDivider(40, 10),
                Packaging(_packageToggle, updatePackageDetails),
                PartialDivider(40, 10),
                buildVoucherSelection(_usedList, _selectedVoucherIds, widget.vouchers, context, addVoucher, removeVoucher),
                SizedBox(height: 10),
                PartialDivider(40, 10),
                DeliveryAddress(_address, _onsitePickup, updateAddress, updateOnsitePickup),
                //PartialDivider(40, 10),
                //buildPhoneNumber(_phoneNumber, updatePhoneNumber),
                //SizedBox(height: 10),
                PartialDivider(40, 10),
                PaymentMethods(_paymentMethod, updatePaymentMethod),
                PartialDivider(40, 10),
                SizedBox(height: 10),
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

