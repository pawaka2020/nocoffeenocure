import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../../models/fullnews.dart';
import 'dart:convert';
import '../../common.dart';
import 'package:http/http.dart' as http;

class FullNewsOnline {

  Future<List<FullNewsOB>> get() async {
    try {
      final response = await http.get(Uri.parse(onlineBackendURL + 'get_fullnews'));
      if (response.statusCode == 200) {
        Iterable fullnewsJson = json.decode(response.body);
        List<FullNewsOB> fullNewsList = [];
        for (var news in fullnewsJson) {
          fullNewsList.add(FullNewsOB()..name = await getImage(news['name'],'fullnews'));
        }
        fullnewsLoaded = true;
        return fullNewsList;
      }
      else {
        fullnewsLoaded = false;
        throw Exception('Failed to load full news: ${response.statusCode}');
      }
    }
    catch (e) {
      print('Error fetching full news: $e');
      fullnewsLoaded = false;
      return [];
    }
  }
}