import 'dart:convert';
import 'package:path_provider/path_provider.dart';

import '../backend/dummy/user.dart';
import '../common.dart';
import '../main.dart';
import '../models/cartitem.dart';
import '../models/token.dart';
import '../models/user.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/voucher.dart';

class UserRepo {
  final box = objectbox.userBox;
  String? currentUserId;

  void remove(int id) {
    box.remove(id);
  }

  // Check if any user in the list is designated as a guest
  bool hasGuestUsers(List<UserOB> users) {
    return users.any((user) => user.guest == true);
  }

  // get currently logged in user.
  UserOB? getLoggedInUser() {
    final users = box.getAll();
    try {
      return users.firstWhere((user) => (user.isLoggedIn == true) && (user.email == singletonUser.email));
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
        box.put(guest);
        singletonUser = guest;

      }
      else {
        print("user in database. We will load the current user, length = ${users.length}");
        //why no log?
        singletonUser = users.firstWhere((user) => user.isLoggedIn == true);
      }
    }
  }

  void loginUser() {
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
      //print("!!! from login, cartitem length = ${singletonUser.cartItems.length}, order length = ${singletonUser.orders.length}");
    }
    //asdadadaadasd
    else {
      print("A registered user has not been detected");
      String token = generateNewUserToken();
      UserOB? loggedinUser = decodeToken(token);

      UserOB guestUser = users.firstWhere((user) => user.guest == true);
      guestUser.isLoggedIn = false;
      box.put(guestUser);
      box.put(loggedinUser);
      singletonUser = loggedinUser!;
      //print("!!! from login, cartitem length = ${singletonUser.cartItems.length}, order length = ${singletonUser.orders.length}");
    }
  }

  void loginUserBackend(String authToken) {
    List<UserOB> users = box.getAll();

    Map<String, dynamic> decodedToken = JwtDecoder.decode(authToken);
    UserOB loggedinUser = UserOB()
      ..userId = decodedToken['user_id']
      ..name = decodedToken['name']
      ..email = decodedToken['email']
      ..birthday = decodedToken['birthday'] != null ? DateTime.parse(decodedToken['birthday']) : null
      //..birthday = decodedToken['birthday'] // this is DateTime?
      ..phoneNumber = decodedToken['phone_number']
      ..address = decodedToken['address']
      ..profileImage = decodedToken['profile_image']
      ..coins = decodedToken['coins']
      ..guest = decodedToken['guest']
      ..isLoggedIn = decodedToken['is_logged_in']
      ..newUser = decodedToken['new_user']
      ..setDefaultAddress = decodedToken['set_default_address']
    ;
    loggedinUser.cartItems.addAll(CartItemOB.listFromJson(decodedToken['cart_items'])); //CartItemOB.listFromJson(decodedToken['cart_items'])
    loggedinUser.vouchers.addAll(VoucherOB.listFromJson(decodedToken['vouchers']));
    loggedinUser.reviews.addAll([]);

    //the rest here is the same
    UserOB guestUser = users.firstWhere((user) => user.guest == true);
    guestUser.isLoggedIn = false;
    box.put(guestUser);

    singletonUser = loggedinUser!;

    //storedProfileImage = storeProfileImage();
  }

  Future<void> logoutUserBackend() async {
    /////
    final url = onlineBackendURL + 'logoff';

    print("Logging off user with userId = ${singletonUser.userId}");

    final Map<String, dynamic> data = {
      'user_id' : singletonUser.userId.toString(),
    };

    // Encode data to JSON
    final jsonData = json.encode(data);
    //
    try
    {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );
      if (response.statusCode == 200) {
        print('User userId = ${singletonUser.userId} logged off successfully');
      }
      else {
        print('Failed to log off user: ${response.statusCode}');
      }
    }
    catch (e) {
      print('Exception caught while logging off user: $e');
    }

  }

  void editUser() {

  }

  void logoutUser() {

    logoutUserBackend();

    List<UserOB> users = box.getAll();
    UserOB guestUser = users.firstWhere((user) => user.guest == true);
    //UserOB registeredUser = users.firstWhere((user) => user.guest == false);


    guestUser.isLoggedIn = true;
    //registeredUser.isLoggedIn = false;

    box.put(guestUser);
    //box.remove(registeredUser.id);
    //box.put(registeredUser);

    singletonUser = guestUser;

    //printToast("!!! from logout, cartitem length = ${singletonUser.cartItems.length}, order length = ${singletonUser.orders.length}");
  }

  List<UserOB> getAll() {
    return box.getAll();
  }

  Future<void> update(String profileImage, String name, String email,
      DateTime birthday, String address, bool setDefaultAddress) async {
    final url = onlineBackendURL + '/api/update_user';
    String imageBase64 = await getImageBase64(profileImage);
    
    singletonUser.profileImage = (profileImage == '') ? '' : 'static/images/users/' + singletonUser.userId! + '/profile_image.jpg';
    singletonUser.name = name;
    singletonUser.email = email;
    singletonUser.birthday = birthday;
    singletonUser.address = address;
    singletonUser.setDefaultAddress = setDefaultAddress;

    final Map<String, dynamic> data = {
      'user_id': singletonUser.userId,
      'name': singletonUser.name,
      'email': singletonUser.email,
      'birthday': singletonUser.birthday!.toIso8601String(), //Converting object to an encodable object failed: Instance of 'DateTime'
      'phone_number': singletonUser.phoneNumber,
      'address': singletonUser.address,
      'profile_image': singletonUser.profileImage,
      //'profile_image': 'static/images/users/' + singletonUser.userId! + '/profile_image.jpg',
      'coins': singletonUser.coins,
      'guest': singletonUser.guest,
      'is_logged_in': singletonUser.isLoggedIn,
      'new_user': singletonUser.newUser,
      'set_default_address': singletonUser.setDefaultAddress,
      // child objects
      'cart_items': singletonUser.cartItems.map((review) => review.toJson()).toList(),
      'image_base_64': imageBase64,
    };
    final jsonData = json.encode(data);
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );
      if (response.statusCode == 200) {
        //(TODO) save images to app's storage here.
        //UserRepo().storeProfileImage();
        storedProfileImage = profileImage;

        printToast('User updated successfully');
      }
      else {
        printToast('Failed to update user: ${response.statusCode}');
      }
    }
    catch (e) {
      printToast('Exception caught while updating user: $e');
    }
  }

  void updateLoggedinUser(String profileImage, String name, String email,
    DateTime birthday, String address, bool setDefaultAddress) {
    UserOB registeredUser = singletonUser; //16/4/2024

    registeredUser.profileImage = profileImage;
    //registeredUser.profileImage = '/static/images/users/' + singletonUser.userId! + '/profile_image.jpg';
    registeredUser.name = name;
    registeredUser.email = email;
    registeredUser.birthday = birthday;
    registeredUser.address = address;
    registeredUser.setDefaultAddress = setDefaultAddress;

    //singletonUser = registeredUser;
    updateBackendUser();
    //4/19/2023
    //singletonUser.profileImage = 'static/images/users/' + singletonUser.userId! + '/profile_image.jpg';


  }

  Future<void> updateBackendUser() async {
    if (singletonUser.guest == false) {
      //print("in updateBackendUser, address 2 = ${singletonUser.address}");
      /*
        saved image in backend = /data/user/0/com.example.nocoffeenocure/cache/731e839f-ef76-43cc-a78f-e7340b93c494/IMG-20240417-WA0004.jpg
        desired image in backend = "/static/images/users/22732379/profile_image.jpg"
      */
      final url = onlineBackendURL + '/api/update_user';
      String imageBase64 = await getImageBase64(singletonUser.profileImage!);
      final Map<String, dynamic> data = {
        'user_id': singletonUser.userId,
        'name': singletonUser.name,
        'email': singletonUser.email,
        'birthday': singletonUser.birthday?.toIso8601String(), //Converting object to an encodable object failed: Instance of 'DateTime'
        'phone_number': singletonUser.phoneNumber,
        'address': singletonUser.address,
        'profile_image': singletonUser.profileImage,
        //'profile_image': 'static/images/users/' + singletonUser.userId! + '/profile_image.jpg',
        'coins': singletonUser.coins,
        'guest': singletonUser.guest,
        'is_logged_in': singletonUser.isLoggedIn,
        'new_user': singletonUser.newUser,
        'set_default_address': singletonUser.setDefaultAddress,
        // child objects
        'cart_items': singletonUser.cartItems.map((review) => review.toJson()).toList(),
        'image_base_64': imageBase64,
      };
      // Encode data to JSON
      final jsonData = json.encode(data);
      try
      {
        final response = await http.post(
          Uri.parse(url),
          headers: <String, String> {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonData,
        );
        if (response.statusCode == 200) {
          printToast('User updated successfully');
        }
        else {
          printToast('Failed to update user: ${response.statusCode}');
        }
      }
      catch (e) {
        printToast('Exception caught while updating user: $e');
      }
    }
    else return ;
  }

  Future<String> getImageBase64(String image_path) async {
    print("profile image = ${image_path}");
    if (image_path == '')
      //logic 1
      return "";
    else {
      //logic 2
      File imageFile = File(image_path);
      List<int> imageBytes = await imageFile.readAsBytes();

      // Convert the image bytes to a base64-encoded string
      String imageBase64 = base64Encode(imageBytes);

      return imageBase64;
    }
  }

  Future<void> putOrderBackend() async {
    if (singletonUser.guest == false) {
      final url = onlineBackendURL + '/api/update_user';
    }
    else return ;
  }

  // returns the path to the image after it has been stored.
  // use it like this:
  // String image = await storeProfileImage();
  // FileImage(File(image));
  Future<void> storeProfileImage() async {
    if (singletonUser.profileImage! == '') {
      storedProfileImage = '';
      return ;
    }

    var response = await http.get(Uri.parse(onlineBackendURL + singletonUser.profileImage!));

    if (response.statusCode == 200) {
      Directory directory = await getApplicationDocumentsDirectory();
      String directoryPath = '${directory.path}/backend/images/users/${singletonUser.userId}/';
      Directory(directoryPath).createSync(recursive: true); // Ensure directory exists
      String filePath = directoryPath + 'profile_image.jpg';
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      storedProfileImage =  filePath;
    }
    else {
      storedProfileImage = '';
    }
  }
}