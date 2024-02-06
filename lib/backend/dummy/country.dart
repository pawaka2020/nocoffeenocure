import '../../models/country.dart';

class CountryDummy {
  Future<List<CountryOB>> get() async {
    int delay = 0;
    await Future.delayed(Duration(seconds: delay));

    List<CountryOB> list = [
      CountryOB()..name = 'USA',
      CountryOB()..name = 'China',
      CountryOB()..name = 'Japan'
    ];
    return list;
  }
}