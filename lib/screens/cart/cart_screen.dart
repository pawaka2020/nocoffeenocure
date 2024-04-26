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
import '../../models/user.dart';
import '../../models/voucher.dart';
import '../../provider/cart_count_notifier.dart';
import '../../repos/cartitem.dart';
import '../../repos/menuitem.dart';
import '../../repos/user.dart';
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

/*
  Views all menu items added to the present cart.
  Includes options to edit or delete a menu item in the cart.
  Includes option to include vouchers as well ie Hari Raya special, new user, birthday voucher, etc
  An address auto-selection feature is in place to help users fill out a full address
  or simply opt for self-pickup at store's address.
  Payment is skipped for now until this app is properly made for a real F&B store
  in the future.
*/
class CartScreen extends StatefulWidget {
  void Function(int) updateCartCount;
  void Function(int) placeOrder;
  bool tracking;

  CartScreen(this.updateCartCount, this.placeOrder,  this.tracking);
  List<CartItemOB> cartItems = CartItemRepo().getAll() ?? [];
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
        CartItemRepo().deleteBackend(id);
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
        CartItemRepo().editBackend(updatedCartItem);
        UserOB? currentUser = UserRepo().getLoggedInUser(); //29/3/2024
        currentUser?.cartItems.add(cartItem);
        print("current user id is ${currentUser?.userId}");
        UserRepo().box.put(currentUser);
        int index = cartItems.indexWhere((item) => item.id == targetId);
        if (index != -1) {
          singletonUser.cartItems[index] = updatedCartItem;
        }
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

  void updatePhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  void updateAddress(String address) {
    setState(() {
      _address = address;
    });
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
    final addedVoucher = await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SelectUnusedVoucherScreen(widget.vouchers, _selectedVoucherIds, context),
    ));
    if (addedVoucher != null) {
      setState(() {
        _usedList.add(widget.vouchers.firstWhere((voucher) => voucher.voucher_id == addedVoucher));
        _selectedVoucherIds.add(addedVoucher);
      });
    }
  }

  void removeVoucher(int id) async {
    bool confirmation = await showDeleteConfirmationDialog(
        context, 'Confirm Deletion', 'Are you sure you want to remove this voucher?');
    if (confirmation) {
      setState(() {
        _selectedVoucherIds.remove(id);
        _usedList.removeWhere((voucher) => voucher.voucher_id == id);
      });
    }
  }

  /*
    Not yet imp
  */
  bool processPayment() {
    return true;
  }

  Future<void> placeOrder() async {
    if (widget.tracking == true) {
      printToast("Error: Order already exists");
      return ;
    }
    if (await checkOrderErrors(widget.tracking, _address, _onsitePickup)) {

      bool paymentProcessed = processPayment();

      if (paymentProcessed) {
        addOrder(_selectedVoucherIds, _usedList, widget.cartItems, _specialRequest,
            _packageString, _address, _onsitePickup, _phoneNumber, _paymentMethod, price);
        _selectedVoucherIds = [];
        widget.placeOrder(widget.cartItems.length);
      }
      else {
        printToast("Error: Payment processing failed");
        return ;
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    widget.vouchers = VoucherRepo().getAll();
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
                // PartialDivider(40, 10),
                SizedBox(height: 10),
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

