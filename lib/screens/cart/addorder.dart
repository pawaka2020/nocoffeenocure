/* This file is solely for the function of adding cart items to an order and
its related functions

First, inside the current User object, set all used Voucher objects's 'activated'
fields as true from their original false values.

To an Order object, add:
0. unique id.
1. All CartItem objects.
2. SpecialRequest String.
3. Packaging String.
4. All Voucher objdets.
5. Delivery mode set to either 'Delivery' or 'Pickup'
6. Address String.
7. PhoneNumber String.
8. PaymentMethod String.
9. Payment double.
10. Auto-generated orderId Int.
11. eta DateTime calculated based from Address.
12. status String, auto-set to 'Order Confirmed'
13. locationLongitude, locationLatitude, based on address.
Add this Order object to current User.
*/

import 'dart:math';

import '../../common.dart';
import '../../models/cartitem.dart';
import '../../models/order.dart';
import '../../models/user.dart';
import '../../models/voucher.dart';
import '../../repos/user.dart';
import '../../repos/voucher.dart';
import 'cart_screen.dart';

void setVouchersToUsed(UserOB currentUser, List<int> selectedVoucherIds) {
  for (var id in selectedVoucherIds) print("id selected = ${id.toString()}");

  for (var id in selectedVoucherIds) {
    for (var voucher in currentUser.vouchers) {
      if (voucher.id == id) {
        voucher.activated = true;
        VoucherRepo().box.put(voucher);
      }
    }
  }
  VoucherRepo().printVoucher(currentUser.vouchers);
}

List<VoucherOB> getSelectedVouchers(UserOB currentUser, List<int> selectedVoucherIds) {
  List<VoucherOB> list = [];

  for (var id in selectedVoucherIds) {
    for (var voucher in currentUser.vouchers) {
      if (voucher.id == id) {
        list.add(voucher);
      }
    }
  }
  return list;
}

//generate orderId as a random 4-digit number.
int generateOrderId()
{
  int orderId = Random().nextInt(9000) + 1000;
  return orderId;
}

// class Price {
//   double amount = 0.0;
//   double sst = 0.0;
//   double voucherDeduction = 0.0;
//   double subtotal = 0.0;
//   double deliveryFee = 0.0;
//   double roundingAdjustment = 0.0;
//   double total = 0.0;
//   Price();
// }

void addOrder(List<int> selectedVoucherIds, List<CartItemOB> cartItems,
    String specialRequest, String packageString, String deliveryAddress,
    bool onSitePickup, Price price) {
  UserOB? currentUser = UserRepo().getLoggedInUser();
  setVouchersToUsed(currentUser!, selectedVoucherIds);
  List<VoucherOB> selectedVouchers = getSelectedVouchers(currentUser, selectedVoucherIds);
  OrderOB newOrder = OrderOB()
    ..orderId = generateOrderId()
    ..cartItems.addAll(cartItems) //WRONG!
    ..specialRequest = specialRequest
    ..packageString = packageString
    ..vouchers.addAll(selectedVouchers) //WRONG!
    ..deliveryAddress = deliveryAddress
    ..onSitePickup = onSitePickup
    //price setting
    ..amount = price.amount
    ..sst = price.sst
    ..voucherDeduction = price.voucherDeduction
    ..subtotal = price.subtotal
    ..totalPrice = price.total
    //time setting
    ..orderPlaced = DateTime.now()
    ..eta = (60 * 25)
  ;
  //printToast("specialRequest = $specialRequest");
  //printToast("packageString = $packageString");
}