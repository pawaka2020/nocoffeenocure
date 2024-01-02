import 'package:avatar_better/avatar_better.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nocoffeenocure/widgets/partial_divider.dart';

import '../../common.dart';
import '../../main.dart';
import '../edit_profile/edit_profile_screen.dart';

Widget detailsRowInfo(String text1, String text2, String infoTitle, String infoText, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(width: 5), // Add spacing between text and icon
            InkWell(
              onTap: () {
                // Show a pop-up dialog with 'infoText' when the icon is tapped
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(infoTitle),
                      content: Text(infoText),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.info, size: 16, color: Colors.blue),
            ),
          ],
        ),
        Text(
          text2,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

Widget loadingBar(int currentPoints, int totalPoints) {
  double progress = currentPoints / totalPoints;

  return Container(
    width: 200,
    padding: EdgeInsets.symmetric(vertical: 8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2.0),
    ),
    child: Stack(
      children: [
        Container(
          height: 20,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
        Container(
          height: 20,
          width: 200 * progress,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
        Center(
          child: Text(
            '$currentPoints / $totalPoints',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildLoggedUserCard(BuildContext context, int currentPoints,
    int totalPoints, void Function() logout) {

  Card membershipDisplayCard = Card(
    elevation: 4.0,
    margin: EdgeInsets.symmetric(vertical: 8.0),
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Level 1 : Coffee Member',
            style: TextStyle(
              fontSize: 20,
              //fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {},
            child: Text('Membership levels and benefits',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.orange,
                )
            ),
          ),
          Divider(),
          Text(
              "${(totalPoints - currentPoints).toString()} exp remaining to reach Level 2 : Coffee Lover",
              textAlign:TextAlign.justify
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.coffee_outlined,
                color: Colors.grey,
                size: 40,
              ),
              loadingBar(currentPoints, totalPoints),
            ],
          ),
          Divider(),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("NCNC Coins : ${40.toString()}"),
              ElevatedButton(
                onPressed: () {  },
                child: Text(
                  "Redeem",
                  style: TextStyle(
                    color: Colors.white,
                  )
                ),
              ),
            ]
          )
        ],
      ),
    )
  );

  Widget profileCard = Card(
    elevation: 4.0,
    margin: EdgeInsets.symmetric(vertical: 8.0),
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [ //change this
              Avatar.circle(
                onTapAvatar: () {
                  printToast("test");
                },
                radius: 35, //35
                text: singletonUser.name!,
                backgroundColor:Colors.grey,
                randomGradient: false, //true
                randomColor: false, //false
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      singletonUser.name!,
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${singletonUser.phoneNumber}',
                      style: TextStyle(fontSize: 12),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'id: ${singletonUser.userId}',
                        style: TextStyle(fontSize: 8),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  // Handle Edit Profile
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditProfileScreen(),
                  ));
                },
                child: Text(
                  'Edit profile',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await showLogoffConfirmationDialog(context, logout);
                },
                child: Text(
                  'Log off',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  return Column(
    children: [
      membershipDisplayCard,
      profileCard,
    ],
  );
}

Future<bool> showLogoffConfirmationDialog(BuildContext context, void Function() logout) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Confirm Logging Off"),
        content: Text("Log Off User?"),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(false); // Return false to indicate cancellation
            },
          ),
          TextButton(
            child: Text('Log off'),
            onPressed: () {
              logout();
              Navigator.of(context).pop(false);
            },
          ),
        ],
      );
    },
  );
}
