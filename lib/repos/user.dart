import '../backend/dummy/user.dart';
import '../main.dart';
import '../models/token.dart';
import '../models/user.dart';

//In release version, only fetch from online database.
//The repo should only have two users: logged in user and guest user.
//the repo should only fetch logged in user
//at the very first time of app launch, create guest user and write into the offline cache.
class UserRepo {
  final box = objectbox.userBox;
  String? currentUserId;

  void remove(int id) {
    box.remove(id);
  }

  Future<void> update(BackendSource source) async {
    // late final newData;
    // late final currentData;
    //
    // if (source == BackendSource.dummy) {
    //   newData = await UserDummy().get();
    // }
    // currentData = box.getAll();
    // if (currentData.isNotEmpty) {
    //   print("replacing entries for VoucherOB");
    //   box.removeAll();
    //   box.putMany(newData);
    // }
    // else {
    //   print("adding new entries for VoucherOB");
    //   box.putMany(newData);
    // }
    // //test print
    // final testData = box.getAll();
    // //printVoucher(testData);

    /*
      If box has no elements with 'guest' set to true, add guest account.
      If box has no elements with 'isLoggedIn' set to true, set the element with 'guest' set to true,
      with 'isLoggedIn' set to true;
      grab 'users' from dummy but do not add to box.
      after pressing 'log in and sign up'
    */
    late final newData;
    late final currentData;
    if (source == BackendSource.dummy) {
      newData = await UserDummy().get();
    }
    currentData = box.getAll();

  }

  // Check if any user in the list is designated as a guest
  bool hasGuestUsers(List<UserOB> users) {

    return users.any((user) => user.guest == true);
  }

  // get currently logged in user.
  UserOB? getLoggedInUser() {
    final users = box.getAll();
    try {
      return users.firstWhere((user) => user.isLoggedIn == true);
    }
    catch (e) {
      return null;
    }
  }

  bool checkForAuthToken() {
    return false;
  }

  Future<void> loginAppStart(BackendSource source) async {
    /*
    first, excute some logic to determine if there is an auth token in storage.
    If there is, create registered User from analyzing that token, but I'll code that later.
    For now I want a logic to determine that there is no auth token in storage for the following
    code to be executed.
    */
    bool hasAuthToken = checkForAuthToken();
    if (hasAuthToken) {
      // Logic to create a registered user from analyzing the token
      // You can add this logic later
    }
    else {
      final users = box.getAll();
      if (users.length == 0) {
        print("no user in database. We will create a new guest user");
        UserOB guest = UserOB()
          ..userId = '0000000000'
          ..name = "Guest"
          ..email = ''
          ..birthday = null
          ..phoneNumber = ""
          ..address = ''
          ..profileImage = ''
          ..coins = 0
          ..guest = true
          ..isLoggedIn = true
          ..newUser = false
        ;
        //print("Has no guests, will create a guest user");
        box.removeAll();
        singletonUser = guest;
        box.put(guest);
      }
      else {
        print("user in database. We will load the current user");
        singletonUser = users.firstWhere((user) => user.isLoggedIn == true);
      }
    }
  }

  void loginUser() {
    //let's pretend that a backend gives us a token.
    String token = generateNewUserToken();
    //we decode that token to an actual user
    UserOB? loggedinUser = decodeToken(token);
    print("loginuser activated");
    box.removeAll();
    singletonUser = loggedinUser!;
    box.put(loggedinUser);
  }

  List<UserOB> getAll() {
    return box.getAll();
  }
}