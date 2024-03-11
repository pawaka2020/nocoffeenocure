import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../../models/bannernews.dart';
import 'dart:convert';
import '../../common.dart';
import 'package:http/http.dart' as http;

class BannerNewsOnline {

  Future<List<BannerNewsOB>> get() async {

    try {
      final response = await http.get(Uri.parse(onlineBackendURL + 'get_bannernews'));
      if (response.statusCode == 200) {
        Iterable bannernewsJson = json.decode(response.body);
        List<BannerNewsOB> bannerNewsList = [];
        for (var news in bannernewsJson) {
          bannerNewsList.add(BannerNewsOB()
            ..image = await getImage(news['image'],'bannernews')
            ..article = news['article']
          );
        }
        bannernewsLoaded = true;
        return bannerNewsList;
      }
      else {
        bannernewsLoaded = false;
        throw Exception('Failed to load banner news: ${response.statusCode}');
      }
    }
    catch (e) {
      print('Error fetching banner news: $e');
      bannernewsLoaded = false;
      return [];
    }
  }
}