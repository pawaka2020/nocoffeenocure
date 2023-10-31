import 'package:objectbox/objectbox.dart';

/*

*/
@Entity()
class UserOB
{
  @Id()
  int id = 0; // for Objectbox's internal bookkeeping operations only, do not use!

  String? userId; // id for user, matching with id from reading auth token.
  String? name; // name of user.
  String? email; // email of user.
  String? address; // address of user, for sending to Lalamove/Grab/other delivery provider APIs.
  //String? profileImage; //profile image of user, if required later on.
}