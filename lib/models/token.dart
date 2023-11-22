import 'package:objectbox/objectbox.dart';

//This is only for testing. Do NOT use this model class later when a proper
//online backend is implemented, for security reasons.
//only one token will be stored regardless of project status.
//however, one exception will be for creating unique 'guest' accounts for phones
// to allow users to use and make orders even without logging in.
@Entity()
class TokenOB {
  @Id()
  int id = 0;

  String? token; //may be encrypted, but it doesn't matter for this particular offline test model
  String? userId; //matches userId field in UserOB for matching using getUserId(token)
  DateTime? expirationDate; //for added security.
  bool? guest; //to further identify this model as guest or logged in user for extra rigidity
}