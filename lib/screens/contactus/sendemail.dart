import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../../common.dart';

//email doesn't work. Let's try just wa/me sending to a whatsapp account instead.
//example: https://wa.me/1234567890?text=Hello%20there!
void sendEmail(BuildContext context, String name, String email, String phone, String subject, String message) async {
  // Craft an email message
  String formattedMessage = '$name\n$phone\n\n$message';

  // Encode the email components for the mailto URL
  String encodedEmail = Uri.encodeComponent(email);
  String encodedSubject = Uri.encodeComponent(subject);
  String encodedMessage = Uri.encodeComponent(formattedMessage);

  // Construct the mailto URL
  String mailtoUrl = 'mailto:rinor85@gmail.com?subject=$encodedSubject&body=$encodedMessage';
  Uri uri = Uri.parse(mailtoUrl);

  // Launch the default email client
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);

    // Show a dialog to inform the user
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: Text('Thank you for your inquiry'),
    //       content: Text('Our team will reply within 1 business day.'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop(); // Close the dialog
    //           },
    //           child: Text('Ok'),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
  else {
    // Handle error
    printToast('Error launching email client');
  }
}