import '../../common.dart';
import '../../models/country.dart';
import '../../repos/country.dart';

class CountryDummy {
  Future<List<CountryOB>> get() async {
    int delay = 0;
    await Future.delayed(Duration(seconds: delay));

    List<CountryOB> list = [
      CountryOB()..name = 'USA',
      CountryOB()..name = 'China',
      CountryOB()..name = 'Japan'
    ];
    countriesLoaded = true;
    //CountryRepo().objectsLoaded = true;
    return list;
  }
}