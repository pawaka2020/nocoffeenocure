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
          ..userId = '000000'
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
    //1. Generate logged user from token
    String token = generateNewUserToken();
    UserOB? loggedinUser = decodeToken(token);

    //2. Objectbox management
    //box.removeAll(); //this is not necessary. (not confirmed yet)
    //List<UserOB> users1 = box.getAll();
    //print("number of users prior to adjustment = ${users1.length}");
    UserOB? currentUser = getLoggedInUser();
    currentUser?.isLoggedIn = false;
    box.put(currentUser);
    //List<UserOB> users2 = box.getAll();
    //print("number of users prior to adjustment = ${users2.length}");

    box.put(loggedinUser); //yes, we should add this token-generated user to the Box.

    //3. Setting as singlleton
    singletonUser = loggedinUser!;
  }

  void loginUser2() {
    List<UserOB> users = box.getAll();
    if (users.any((user) => user.guest == false)) {
      print("A registered user has been detected");

      UserOB guestUser = users.firstWhere((user) => user.guest == true);
      UserOB registeredUser = users.firstWhere((user) => user.guest == false);

      guestUser.isLoggedIn = false;
      registeredUser.isLoggedIn = true;

      box.put(guestUser);
      box.put(registeredUser);

      singletonUser = registeredUser;
    }
    else {
      print("A registered user has not been detected");

      String token = generateNewUserToken();
      UserOB? loggedinUser = decodeToken(token);
      UserOB guestUser = users.firstWhere((user) => user.guest == true);
      guestUser.isLoggedIn = false;
      box.put(guestUser);
      box.put(loggedinUser);
      singletonUser = loggedinUser!;
    }
  }

  void logoutUser() {
    List<UserOB> users = box.getAll();
    UserOB guestUser = users.firstWhere((user) => user.guest == true);
    UserOB registeredUser = users.firstWhere((user) => user.guest == false);

    guestUser.isLoggedIn = true;
    registeredUser.isLoggedIn = false;

    box.put(guestUser);
    box.put(registeredUser);

    singletonUser = guestUser;
  }

  List<UserOB> getAll() {
    return box.getAll();
  }

  void updateLoggedinUser(String profileImage, String name, String email,
      DateTime birthday, String address, bool setDefaultAddress) {
    List<UserOB> users = box.getAll();
    UserOB registeredUser = users.firstWhere((user) => user.guest == false);
    //
    registeredUser.profileImage = profileImage;
    registeredUser.name = name;
    registeredUser.email = email;
    registeredUser.birthday = birthday;
    registeredUser.address = address;
    registeredUser.setDefaultAddress = setDefaultAddress;

    box.put(registeredUser);
    singletonUser = registeredUser;
  }
}