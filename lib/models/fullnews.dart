import 'package:objectbox/objectbox.dart';

/*OnboardingScreen*/
@Entity()
class FullNewsOB {
  @Id()
  int id = 0;
  String? name;

  FullNewsOB();
  factory FullNewsOB.fromJson(Map<String, dynamic> json) {
    return FullNewsOB()
      ..name = json['name'];
  }
}

