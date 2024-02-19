import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../../common.dart';
import '../../models/fullnews.dart';

class FullNewsDummy {

  Future<List<FullNewsOB>> get() async {
    int delay = 0;
    await Future.delayed(Duration(seconds: delay));

    List<FullNewsOB> result = [
      FullNewsOB()..name = await copyAssetToStorage('assets/images/news1.png')
    ];
    return result;
  }
}