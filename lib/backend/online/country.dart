import 'dart:convert';

import '../../common.dart';
import '../../models/country.dart';
import 'package:http/http.dart' as http;

import '../../repos/country.dart';

class CountryOnline {
  Future<List<CountryOB>> get() async {
    try {
      final response = await http.get(Uri.parse(onlineBackendURL + 'get_countries'));

      if (response.statusCode == 200) {
        Iterable countriesJson = json.decode(response.body);
        countriesLoaded = true;
        //CountryRepo().objectsLoaded = true;
        return List<CountryOB>.from(countriesJson.map((json) => CountryOB.fromJson(json)));
      }
      else {
        throw Exception('Failed to load countries: ${response.statusCode}');
        countriesLoaded = false;
        return [];
      }
    }
    catch (e) {
      print('Error fetching countries: $e');
      countriesLoaded = false;
      return [];
    }
  }
}

