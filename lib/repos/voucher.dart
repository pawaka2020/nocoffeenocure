import 'package:nocoffeenocure/repos/user.dart';

import '../backend/dummy/voucher.dart';
import '../backend/online/voucher.dart';
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
    else if (source == BackendSource.online) {
      newData = await VoucherOnline().get();

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

    //add only picked vouchers to Users
    UserOB? currentUser = UserRepo().getLoggedInUser();
    for (var voucher in newData) {
      bool hasMatchingVoucherId = false;
      for (var voucher2 in currentUser!.vouchers) {
        if (voucher.voucher_id == voucher2.voucher_id) {
          hasMatchingVoucherId = true;
          break;
        }
      }
      if (!hasMatchingVoucherId) {
        currentUser.vouchers.add(voucher);
      }
    }
    //currentUser?.vouchers.addAll(newData);
    UserRepo().box.put(currentUser);
    //4/4/2024
    singletonUser = currentUser!;

    // Now list2 contains elements from list that don't have matching voucher_id
  }

  List<VoucherOB> getAll() {
    //return box.getAll();


    // UserOB? currentUser = UserRepo().getLoggedInUser();
    // // //printVoucher(currentUser!.vouchers);
    // List<VoucherOB> vouchers = box.getAll();
    //
    //
    // // return vouchers;
    // singletonUser = currentUser;
    // //3/27/2024
    return singletonUser.vouchers;
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

  // List<VoucherOB> getNotFromIdList(List<VoucherOB> allVouchers, List<int> _selectedVoucherIds) {
  //   final notSelectedVouchers = allVouchers.where((voucher) => !_selectedVoucherIds.contains(voucher.id)).toList() ;
  //   return notSelectedVouchers;
  // }
  List<VoucherOB> getNotFromIdList(List<VoucherOB> allVouchers, List<int> _selectedVoucherIds) {
    print("getNotFromIdList started");
    printVoucher(allVouchers);
    for (var id in _selectedVoucherIds) {
      "inside getNotFromIdList, id = ${id.toString()}";
    }
    final results = allVouchers.where((voucher) =>
    !_selectedVoucherIds.contains(voucher.voucher_id) && voucher.activated == false
    ).toList();
    for (var result in results) {
      print("getNotFromIdList results : id = ${result.voucher_id.toString()}, activated = ${result.activated.toString()}");
    }
    return results;
  }

  //
  List<VoucherOB> getFromIdList(List<VoucherOB> allVouchers, List<int> _selectedVoucherIds) {
    final results = allVouchers.where((voucher) => _selectedVoucherIds.contains(voucher.voucher_id) && voucher.activated == false).toList();
    for (var result in results) {
      print("getFromIdList results : id = ${result.voucher_id.toString()}, activated = ${result.activated.toString()}");
    }
    return results;
  }
}