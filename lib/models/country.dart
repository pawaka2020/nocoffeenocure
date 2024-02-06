// class Country {
//   final int id;
//   final String name;
//
//   Country({required this.id, required this.name});
//
//   factory Country.fromJson(Map<String, dynamic> json) {
//     return Country(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }

/*
Test class
*/
import 'package:objectbox/objectbox.dart';

@Entity()
class CountryOB {
  @Id()
  int id = 0;
  String? name;

  CountryOB();
  factory CountryOB.fromJson(Map<String, dynamic> json) {
    return CountryOB()
      //..id = json['id']
      ..name = json['name'];
  }
}