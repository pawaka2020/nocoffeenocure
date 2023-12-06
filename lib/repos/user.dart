import '../backend/dummy/user.dart';
import '../main.dart';
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

  Future<void> loginAppStart(BackendSource source) async {
    late final newData;
    late final currentData;
    if (source == BackendSource.dummy) {
      newData = await UserDummy().get();
    }
    currentData = box.getAll();
    if (hasGuestUsers(currentData)) {
      print("Guest account already created, will log in current user");
      final loggedUser = getLoggedInUser();
      //load cartitem, order, current vouchers, etc from loggedUser
    }
    else {
      print("Has no guests, will create a guest user");
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
      ;
      box.put(guest);
    }
  }

  List<UserOB> getAll() {
    return box.getAll();
  }
}