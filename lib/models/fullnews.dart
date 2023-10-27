import 'package:objectbox/objectbox.dart';
//News at onboarding screen.

/*For Objectbox offline cache.*/
@Entity()
class FullNewsOB {
  @Id()
  int id = 0;

  String? name;
}

