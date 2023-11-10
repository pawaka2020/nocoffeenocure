import '../backend/dummy/voucher.dart';
import '../main.dart';
import '../models/voucher.dart';

//
// class CartItemRepo {
//   final box = objectbox.cartItemBox;
//
//   void remove(int id) {
//     box.remove(id);
//   }
//
//   Future<void> update(BackendSource source) async {
//     late final newData;
//     late final currentData;
//
//     if (source == BackendSource.dummy) {
//       newData = await CartItemDummy().get();
//     }
//     currentData = box.getAll();
//     if (currentData.isNotEmpty) {
//       print("replacing for CartItemOB");
//       box.removeAll(); //the id of 'box' does not reset to 0.
//       box.putMany(newData);
//     }
//     else {
//       print("adding for CartItemOB");
//       box.putMany(newData);
//     }
//     //testPrint();
//   }
//
//   List<CartItemOB> getAll() {
//     return box.getAll();
//   }
//
//   void put(CartItemOB cartItem){
//     box.put(cartItem);
//   }
//
//   void testPrint() {
//     List<CartItemOB> list = getAll();
//     for (var item in list) {
//       print('Cart Item ID: ${item.id}');
//       // print('Image: ${item.menuItemOB[0].imagePath ?? 'N/A'}');
//       // print('Name: ${item.menuItemOB[0]. ?? 'N/A'}');
//       // print('Content: ${item.content ?? 'N/A'}');
//       print('Quantity: ${item.quantity ?? 0}');
//       // print('MenuItem ID: ${item.menuItem_id ?? 0}');
//       print('---------------------------');
//     }
//   }
//
//
// }

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
    //test print
    final testData = box.getAll();
    printVoucher(testData);
  }

  List<VoucherOB> getAll() {
    return box.getAll();
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