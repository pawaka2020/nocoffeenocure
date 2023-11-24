/* This file is solely for the function of adding cart items to an order and
its related functions

First, inside the current User object, set all used Voucher objects's 'activated'
fields as true from their original false values.

To an Order object, add:
1. All CartItem objects.
2. SpecialRequest String.
3. Packaging String.
4. Delivery mode set to either 'Delivery' or 'Pickup'
5. Address String.
6. PhoneNumber String.
7. PaymentMethod String.
8. Payment double.
9. Auto-generated orderId Int.
10. eta DateTime calculated based from Address.
11. status String, auto-set to 'Order Confirmed'
12. locationLongitude, locationLatitude, based on address.
Add this Order object to current User.
*/

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

void addOrder(List<int> selectedVoucherIds) {
  setVouchersToUsed(selectedVoucherIds);
}