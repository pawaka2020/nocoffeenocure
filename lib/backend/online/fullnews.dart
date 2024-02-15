import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../../models/fullnews.dart';
import 'dart:convert';
import '../../common.dart';
import 'package:http/http.dart' as http;

class FullNewsOnline {

  Future<String> getImage(String dbimage, String dir) async {
    String filename = dbimage.split('/').last;
    String imageUrl = onlineBackendURL + dir + filename;
    var imageDataResponse = await http.get(Uri.parse(imageUrl));
    if (imageDataResponse.statusCode == 200) {
      Directory directory = await getApplicationDocumentsDirectory();
      String directoryPath = '${directory.path}/backend/images/';
      Directory(directoryPath).createSync(recursive: true); // Ensure directory exists
      String filePath = '$directoryPath$filename';
      File file = File(filePath);
      await file.writeAsBytes(imageDataResponse.bodyBytes);
    }
    else {

    }
    return '';
  }

  Future<List<FullNewsOB>> get() async {
    try {
      final response = await http.get(Uri.parse(onlineBackendURL + 'fullnews'));
      if (response.statusCode == 200) {
        Iterable fullnewsJson = json.decode(response.body);
        List<FullNewsOB> fullNewsList = [];
        for (var news in fullnewsJson) {
          //
          String filename = news['name'].split('/').last;
          String imageUrl = onlineBackendURL + 'images/fullnews/$filename';
          var imageDataResponse = await http.get(Uri.parse(imageUrl));
          if (imageDataResponse.statusCode == 200) {
            Directory directory = await getApplicationDocumentsDirectory();
            String directoryPath = '${directory.path}/backend/images/';
            Directory(directoryPath).createSync(recursive: true); // Ensure directory exists
            String filePath = '$directoryPath$filename';
            File file = File(filePath);
            await file.writeAsBytes(imageDataResponse.bodyBytes);
            FullNewsOB fullNewsOB = FullNewsOB()..name = filePath;
            fullNewsList.add(fullNewsOB);
          }
          else {
            fullnewsLoaded = false;
            throw Exception('Failed to fetch image data: ${imageDataResponse.statusCode}');
          }
        }
        fullnewsLoaded = true;
        return fullNewsList;
      } else {
        fullnewsLoaded = false;
        throw Exception('Failed to load full news: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching full news: $e');
      fullnewsLoaded = false;
      return [];
    }
  }
}