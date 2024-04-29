/*
This is just a placeholder class to test out backend connections.
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
      ..name = json['name'];
  }
}