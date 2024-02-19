import '../backend/dummy/country.dart';
import '../backend/online/country.dart';
import '../main.dart';
import '../models/country.dart';

class CountryRepo{
  final box = objectbox.countryBox;
  bool objectsLoaded = false;

  Future<void> update2(BackendSource source) async {
    late final newData;
    late final currentData;

    if (source == BackendSource.dummy)
      newData = await CountryDummy().get();

    else if (source == BackendSource.online)
      newData = await CountryOnline().get();

    currentData = box.getAll();

    if (currentData.isNotEmpty) {
      print("replacing for CountryOB");
      box.removeAll(); //the id of 'box' does not reset to 0.
      box.putMany(newData);
    }
    else {
      print("adding for CountryOB");
      box.putMany(newData);
    }
    printCountryList(newData);
  }

  Future<void> update(BackendSource source) async {
    late var newData;
    late var currentData;



    if (source == BackendSource.dummy)
      newData = await CountryDummy().get();

    else if (source == BackendSource.online)
      newData = await CountryOnline().get();

    currentData = box.getAll();
    if (currentData.isNotEmpty) {
      print("replacing for CountryOB");
      box.removeAll(); //the id of 'box' does not reset to 0.
      box.putMany(newData);
    }
    else {
      print("adding for CountryOB");
      box.putMany(newData);
    }
    printCountryList(newData);
  }

  void printCountryList(List<CountryOB> list) {
    for (var item in list) {
      print("Country loaded: ${item.name}");
    }
  }
}