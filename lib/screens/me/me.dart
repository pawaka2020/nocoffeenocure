import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/me/privacy_policy.dart';
import 'package:nocoffeenocure/screens/me/tos.dart';
import 'package:uni_links/uni_links.dart';
import '../../common.dart';
import '../../main.dart';
import '../../repos/user.dart';
import '../../widgets/partial_divider.dart';
import '../contactus/contactus.dart';
import '../contactus/storelocation.dart';
import '../faq/faq.dart';
import '../settings/settings.dart';
import 'about_us.dart';
import 'buildloggedusercard.dart';
import 'login_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'loginuser.dart';
import 'ourbean.dart';

/*
Leads users to other screens 'help', 'talk to us', 'terms of service',
'privacy policy', 'about us'.
Log in card at the top.
According to website: 'About', 'Our Bean', 'Locations', Contact Us', 'Settings'
*/

class MeScreen extends StatefulWidget {
  void Function(int) updateCartCount;
  void Function(bool, int) setTracking;

  MeScreen(this.updateCartCount, this.setTracking);
  @override
  State<StatefulWidget> createState() => _MeState();
}

class _MeState extends State<MeScreen> {

  void loginUser() {
    setState(() {
      widget.updateCartCount(singletonUser.cartItems.length * -1);
      widget.setTracking(false, 4);
      UserRepo().loginUser2();
      printToast("Successfully logged in");
    });
  }

  void logoutUser() {
    setState(() {
      widget.updateCartCount(singletonUser.cartItems.length * -1);
      widget.setTracking(false, 4);
      UserRepo().logoutUser(); //this works
      printToast('Successfully logged out');
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 28.0,),
            child:
            singletonUser.guest == true
                ? buildGuestCard(loginUser)
                : buildLoggedUserCard(context, 50, 100, logoutUser)
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              children: [
                //add one more
                buildMeCard(context, 'FAQ', Icons.help_outline, FAQScreen()),
                buildMeCard(context, 'Contact Us', Icons.chat_bubble_outline, ContactUsScreen()),
                buildMeCard(context, 'Terms of Service', Icons.description, TOSScreen()),
                buildMeCard(context, 'Privacy Policy', Icons.privacy_tip, PrivacyPolicyScreen()),
                buildMeCard(context, 'About Us', Icons.info_outline, AboutUsScreen()),
                buildMeCard(context, 'Our Bean', Icons.local_cafe, OurBeanScreen()),
                buildMeCard(context, 'Locations', Icons.location_on, StoreLocationScreen()),
                buildMeCard(context, 'Settings', Icons.settings, SettingsScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void navigateTo(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }
}

/*
Template for Cards in this screen.
*/
Widget buildMeCard(BuildContext context, String title, IconData icon, Widget screen) {
  return Card(
    elevation: 4.0,
    margin: EdgeInsets.symmetric(vertical: 8.0),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => screen,
        ));
      },
      child: Padding(
        padding: EdgeInsets.all(12.0), //default 16
        child: Row(
          children: [
            Icon(
              icon,
              size: 27.0, //default 36
            ),
            SizedBox(width: 12.0), //default 16
            Text(
              title,
              style: TextStyle(
                fontSize: 15.0, //default 20
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildGuestCard(void Function() func) {
  return GestureDetector(
    onTap: () {
      func();
    },
    child: Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.orange,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  'Welcome, Guest.',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'id: ${singletonUser.userId}',
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                child: Text(
                  'Log in or Sign Up',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

//make this a stateful widget later so it can shift forms.
class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigate to the 'LoginScreen' when the Card is tapped
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => LoginScreen(),
        // ));
        //sendWhatsapp(context);
        //print("tapped");
        //handleDeepLink('awda');

        UserRepo().loginUser();
      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.orange,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    'Welcome, Guest',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: Text(
                    'Log in or Sign Up',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void sendWhatsapp(BuildContext context) async {
  String phone = "+601133019914";
  String messageTest = "Hello World";
  String message = "Hi No Coffee No Cure, I need my cure now!";
  final url = Uri.parse('https://wa.me/$phone?text=${Uri.encodeFull(message)}');
  String? urlResponse;

  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
  else {
    //capture url link when user clicks on the URL response presented by Whatsapp Business API.
    //urlResponse = ??
  }
  linkStream.listen((String? _link) {
    print("link captured = $_link");
    // Handle the link and extract parameters
    // Extract parameters from the link (token, phone, etc.)
    // Perform user authentication based on the received parameters
    // presumably navigate to registration for first timers.
  });
}

void sendWhatsapp2(BuildContext context) async {
  String phone = "+601133019914";
  String messageTest = "Hello World";
  String message = "Hi No Coffee No Cure, I need my cure now!";
  final url = Uri.parse('https://wa.me/$phone?text=${Uri.encodeFull(message)}');

  final FlutterShareMe flutterShareMe = FlutterShareMe();
  String? response;

  response = await flutterShareMe.shareToWhatsApp4Biz(
    msg: message,

  );
  print(response);
}

//https://omegacoffee.com/redirect?token=unique_token&app_installed=true
//unique_token = eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c




