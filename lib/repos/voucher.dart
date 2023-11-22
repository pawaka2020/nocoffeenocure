import 'package:nocoffeenocure/repos/user.dart';

import '../backend/dummy/voucher.dart';
import '../main.dart';
import '../models/user.dart';
import '../models/voucher.dart';

class VoucherRepo {
  final box = objectbox.voucherBox;

  void remove(int id) {
    box.remove(id);
  }

  Future<void> update(BackendSource source) async {
    late final newData;
    late final currentData;

    if (source == BackendSource.dummy) {
      newData = await VoucherDummy().get();
    }
    currentData = box.getAll();
    if (currentData.isNotEmpty) {
      print("replacing entries for VoucherOB");
      box.removeAll();
      box.putMany(newData);
    }
    else {
      print("adding new entries for VoucherOB");
      box.putMany(newData);
    }

    UserOB? currentUser = UserRepo().getLoggedInUser();
    print("User detected in voucherrepo, ${currentUser?.name}");
    currentUser?.vouchers.addAll(newData);
    UserRepo().box.put(currentUser);

  }

  List<VoucherOB> getAll() {
    //return box.getAll();
    UserOB? currentUser = UserRepo().getLoggedInUser();
    List<VoucherOB> vouchers = currentUser!.vouchers;
    return vouchers;
  }

  List<VoucherOB> getAllFromUser() {
    UserOB? currentUser = UserRepo().getLoggedInUser();
    List<VoucherOB> vouchers = currentUser!.vouchers;
    return vouchers;
  }

  void printVoucher(List<VoucherOB> list) {
    for (var voucher in list) {
      print("Voucher ID: ${voucher.id}");
      print("Image: ${voucher.image}");
      print("Price Discount: ${voucher.priceDiscount}");
      print("Price Deduct: ${voucher.priceDeduct}");
      if (voucher.expiryDate != null) {
        print("Expiry Date: ${voucher.expiryDate!.toLocal()}"); // Convert to local time
      } else {
        print("Expiry Date: N/A");
      }
      print("Activated: ${voucher.activated}");
      print("\n");
    }
  }

  List<VoucherOB> getNotFromIdList(List<VoucherOB> allVouchers, List<int> _selectedVoucherIds) {
    final notSelectedVouchers = allVouchers.where((voucher) => !_selectedVoucherIds.contains(voucher.id)).toList();
    return notSelectedVouchers;
  }
  //
  List<VoucherOB> getFromIdList(List<VoucherOB> allVouchers, List<int> _selectedVoucherIds) {
    final notSelectedVouchers = allVouchers.where((voucher) => _selectedVoucherIds.contains(voucher.id)).toList();
    return notSelectedVouchers;
  }
}