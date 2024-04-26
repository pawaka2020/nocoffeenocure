import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../../common.dart';

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
  }
  else {
    // Handle error
    printToast('Error launching email client');
  }
}