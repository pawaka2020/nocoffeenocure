import '../models/token.dart';
import '../models/user.dart';

void testToken() {
  String newUserToken = generateNewUserToken();
  UserOB? newUser = decodeToken(newUserToken);

  print("New user id = ${newUser?.userId}");
}
