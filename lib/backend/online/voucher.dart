import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../../models/menuitem.dart';
import 'dart:convert';
import '../../common.dart';
import 'package:http/http.dart' as http;

import '../../models/voucher.dart';

class VoucherOnline {
  Future<List<VoucherOB>> get() async {
    try {
      final response = await http.get(Uri.parse(onlineBackendURL + 'get_vouchers'));
      if (response.statusCode == 200) {
        Iterable voucherJson = json.decode(response.body);
        List<VoucherOB> voucherList = [];

        for (var json in voucherJson) {
          VoucherOB voucher = VoucherOB()
            ..voucher_id = json['voucher_id']
            ..image = onlineBackendURL + json['image']
            ..activated = json['activated']
            ..expiryDate = json['expiryDate'] != null ? DateTime.parse(json['expiryDate']) : null
            ..priceDeduct = json['priceDeduct'] != null ? double.parse(json['priceDeduct'].toString()) : null
            ..priceDiscount = json['priceDiscount'] != null ? double.parse(json['priceDiscount'].toString()) : null
          ;
          voucherList.add(voucher);
        }
        voucherLoaded = true;
        return voucherList;
      }
      else {
        voucherLoaded = false;
        throw Exception('Failed to load voucher: ${response.statusCode}');
      }
    }
    catch (e) {
      print('Error fetching voucher: $e. Consider matching ip address to backend or ensure the backend has been launched first');
      voucherLoaded = false;
      return [];
    }
  }
}