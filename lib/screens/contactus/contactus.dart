import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/contactus/sendemail.dart';
import 'package:nocoffeenocure/screens/contactus/storelocation.dart';
import 'package:nocoffeenocure/widgets/partial_divider.dart';
import '../../common.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

Widget buildBulletPointText(String text) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(4.0),
    child: Row(
      children: [
        Icon(
          Icons.brightness_1,
          size: 10.0,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
          ),
        ),
      ],
    ),
  );
}

Widget buildForm(String _value, String title, String label, {bool isMultiline = false, required Function(String) onChanged}) {
  TextEditingController _textEditingController = TextEditingController(text: _value);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              " *",
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 5),
      TextField(
        controller: _textEditingController,
        onChanged: (value) {
          onChanged(value); // Update the variable in the parent widget
        },
        maxLines: isMultiline ? 6 : 1,
        style: TextStyle(
          fontSize: 12,
          color: Colors.blue,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: label,
          hintStyle: TextStyle(fontSize: 10),
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}

class ContactUsScreen extends StatelessWidget {

  String _name = '';
  String _email = '';
  String _phone = '';
  String _subject = '';
  String _message = '';

  void sendWhatsappMessage(BuildContext context, String name, String email, String phone, String subject, String message) async {
    // Phone number in international format (+60172520691 in this case)

    print("name = $name");

    String phoneNumber = '+60172520691';

    // Format the message
    String formattedMessage = '$subject\n\n$message\n\n$name\n$phone\n$email';

    // URL encode the message
    String encodedMessage = Uri.encodeComponent(formattedMessage);

    print("formatted message = $formattedMessage");
    // Construct the WhatsApp URL
    String whatsappUrl = 'https://wa.me/$phoneNumber?text=$encodedMessage';

    // Launch the default browser to open WhatsApp with the pre-filled message
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);

      // Show a dialog to inform the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Thank you for your inquiry'),
            content: Text('Our team will reply within 1 business day.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    } else {
      // Handle error
      print('Error launching WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        children: [
          SizedBox(height: 20),
          Card(
            elevation: 4.0, // Add elevation for a floating effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                "assets/images/contactuspic.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text("Coffee Fans Sdn Bhd (M)",
              style: TextStyle(
                fontSize: 16,
              )
          ),
          SizedBox(height: 10),
          Text(
            "C-02-10, Ten Kinrara, Jalan BK 5a/3a, Bandar Kinrara, 47180 Puchong, Selangor",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StoreLocationScreen(),
              ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, ///Button background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Rounded button edges
              ),
            ),
            child: Container(
              width: double.infinity, // Occupy the maximum available width
              child: Center(
                child: Text(
                  "View Location",
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16, // Text size
                  ),
                ),
              ),
            ),
          ),
          PartialDivider(5, 30),
          buildBulletPointText('Do you have any coffee-related questions for you to discuss with us?'),
          SizedBox(height: 10),
          buildBulletPointText('Is there a problem with your account?'),
          SizedBox(height: 10),
          buildBulletPointText('Looking for current job opportunities?'),
          SizedBox(height: 10),
          buildBulletPointText('Want to join us?'),
          SizedBox(height: 10),
          Text("Send us an email using the email address below"),
          SizedBox(height: 10),
          Text("General inquiries:"),
          SizedBox(height: 10),
          Text("hello@nocoffeenocure.com",
            style: TextStyle(
              color: Colors.orange
            )
          ),
          PartialDivider(5, 30),
          buildForm(_name, "Your Name", "Enter name here", onChanged: (value) => _name = value),
          buildForm(_email, "Your Email Address", "Enter email here", onChanged: (value) => _email = value),
          buildForm(_phone, "Your Phone Number", "Enter phone number here", onChanged: (value) => _phone = value),
          buildForm(_subject, "Subject", "Enter subject here", onChanged: (value) => _subject = value),
          buildForm(_message, "Message", "Enter message here", onChanged: (value) => _message = value, isMultiline: true),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              sendEmail(context, _name, _email, _phone, _subject, _message);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, ///Button background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Rounded button edges
              ),
            ),
            child: Container(
              width: double.infinity, // Occupy the maximum available width
              child: Center(
                child: Text(
                  "Send",
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16, // Text size
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}