import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:nocoffeenocure/screens/settings/pushnotification.dart';

import '../../widgets/partial_divider.dart';
import '../settings/savechanges.dart';
import 'languageselection.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsScreen> {
  bool notificationToggle = true; // Default value for notification toggle
   // Set default language
  final List<String> languages = [
    'English',
    'Bahasa', // replacing 'Malay' with 'Bahasa'
    '中文',    // replacing 'Mandarin' with the Chinese word for it
    'தமிழ்',  // replacing 'Tamil' with the Tamil word for it
  ];
  String selectedLanguage = 'English';

  void changeLanguage(String? value) {
    setState(() {
      selectedLanguage = value!;
    });
  }

  void setNotification(bool value) {
    setState(() {
      notificationToggle = value;
    });
  }

  void saveChanges(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
            padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0, bottom: 16.0),
            children: [
              buildLanguageSelection(languages, selectedLanguage, changeLanguage),
              PartialDivider(20, 30),
              SizedBox(height: 10),
              buildPushNotification2(notificationToggle, setNotification),
              SizedBox(height: 10),
              PartialDivider(20, 30),
            ],
          ),

          ),
          buildSaveChanges(context, saveChanges)
        ]
      )
    );
  }
}





