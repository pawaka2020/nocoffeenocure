import '../../models/voucher.dart';

class VoucherDummy {
  Future<List<VoucherOB>> get() async {
    int delay = 0;

    await Future.delayed(Duration(seconds: delay));
    List<VoucherOB> result = [
      VoucherOB()
        ..image = 'assets/images/vouchertest1.png'
        ..activated = false
        ..expiryDate = DateTime(2023, 12, 31)
        ..priceDeduct = 5
        ..priceDiscount = 1.00 as double
        //..id = 0
      ,
      VoucherOB()
        ..image = 'assets/images/vouchertest2.png'
        ..activated = false
        ..expiryDate = DateTime(2025, 6, 14)
        ..priceDeduct = 0
        ..priceDiscount = 0.85 as double
        //..id = 1
      ,
      VoucherOB()
        ..image = 'assets/images/vouchertest3.png'
        ..activated = false
        ..expiryDate = DateTime(2023, 2, 15)
        ..priceDeduct = 0
        ..priceDiscount = 0.5 as double
        //..id = 2
      ,
      VoucherOB()
        ..image = 'assets/images/vouchertest4.png'
        ..activated = false
        ..expiryDate = DateTime(2023, 5, 30)
        ..priceDeduct = 0
        ..priceDiscount = 0.90 as double
        //..id = 3
      ,
      VoucherOB()
        ..image = 'assets/images/vouchertest5.png'
        ..activated = false
        ..expiryDate = DateTime(2023, 9, 5)
        ..priceDeduct = 2
        ..priceDiscount = 1.00 as double
        //..id = 4
      ,
    ];
    return result;
  }
}