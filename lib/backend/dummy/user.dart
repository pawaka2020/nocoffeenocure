import '../../models/user.dart';


class UserDummy {
  Future<List<UserOB>> get() async {
    int delay = 0;
    await Future.delayed(Duration(seconds: delay));
    List<UserOB> result = [
      UserOB()
        ..userId = '1234567890'
        ..name = "John Doe"
        ..email = 'test123@gmail.com'
        ..birthday = null
        ..phoneNumber = "+62222222222"
        ..address = ''
        ..profileImage = ''
        ..coins = 300
        ..guest = false
        ..isLoggedIn = false
      ,
      UserOB()
        ..userId = '0123456789'
        ..name = "Ali Baba"
        ..email = 'alibaba123@gmail.com'
        ..birthday = null
        ..phoneNumber = "+600000000"
        ..address = ''
        ..profileImage = ''
        ..coins = 300
        ..guest = false
        ..isLoggedIn = false
      ,
      UserOB()
        ..userId = '032145687'
        ..name = "Malcolm Dowell"
        ..email = 'mcdowellpro@gmail.com'
        ..birthday = null
        ..phoneNumber = "+600000000"
        ..address = ''
        ..profileImage = ''
        ..coins = 300
        ..guest = false
        ..isLoggedIn = false
      ,
    ];
    return result;
  }
}
