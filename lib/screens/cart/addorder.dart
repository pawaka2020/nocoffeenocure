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
import '../../repos/user.dart';
import '../../repos/voucher.dart';

void setVouchersToUsed(List<int> selectedVoucherIds) {
  for (var id in selectedVoucherIds) print("id selected = ${id.toString()}");
  UserOB? currentUser = UserRepo().getLoggedInUser();
  for (var id in selectedVoucherIds) {
    for (var voucher in currentUser!.vouchers) {
      if (voucher.id == id) {
        voucher.activated = true;
        VoucherRepo().box.put(voucher);
      }
    }
  }
  currentUser = UserRepo().getLoggedInUser();
  VoucherRepo().printVoucher(currentUser!.vouchers);
}

//generate orderId as a random 4-digit number.
int generateOrderId()
{
  int orderId = Random().nextInt(9000) + 1000;
  return orderId;
}

void addOrder(
    List<int> selectedVoucherIds,
    List<CartItemOB> cartItems,
    String specialRequest,
    String packageString,
    ) {
  setVouchersToUsed(selectedVoucherIds);
  OrderOB newOrder = OrderOB()
    ..orderId = generateOrderId()
    ..cartItems.addAll(cartItems)
    ..specialRequest = specialRequest
    ..packageString = packageString

  ;
  //printToast("specialRequest = $specialRequest");
  //printToast("packageString = $packageString");
}