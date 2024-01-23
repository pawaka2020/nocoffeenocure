import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

/*
Level 1 - Coffee Taster
- Welcome discount on the first coffee order
- Access to discount vouchers
- Free delivery on the first 5 orders.
Level 2 - Coffee Lover
- 15% discount on all purchases
- Early access to seasonal coffee offerings
- Priority notification on new arrivals and popular blends
Level 3 - Coffee Connoisseur
- Exclusive access to limited edition coffee blends
- Early access to new coffee releases
- Personalized recommendations based on taste preferences
Level 4 - Coffee Aficionado
- 25% discount on all purchases
- Free tasting and review on new coffee releases
- Quarterly coffee tasting events with industry experts
Level 5 - Coffee Maestro
- Customized coffee subscriptions with unique blends
- Invitations to behind-the-scenes tours of top coffee roasteries
- Special edition app features, such as personalized brewing guides

How to gain XP?
- Daily check-ins [+2xp]
- Purchase of new items [+20xp]
- Writing reviews after purchase of new items [+4xp]
- Achieving milestones [+30 xp]
*/

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

class MembershipScreen extends StatelessWidget {

  String str1 = '- Special 20% discount on the first coffee order.';
  String str2 = '- Access to discount vouchers.';
  String str3 = '- Free delivery on first 5 orders.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Membership levels',
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
                Card(
                  elevation: 4.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            'Level 1 : Coffee Taster',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.coffee_outlined,
                                color: Colors.grey,
                                size: 40,
                              ),
                              loadingBar(0, 100),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 10),
                          Text(
                            // 'Special 20% discount on the first coffee order\n'
                            //     'Access to discount vouchers\n'
                            //     'Free delivery on first 5 orders',
                            str1 + '\n' + str2 + '\n' + str3,
                            textAlign:TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ]
                      )
                  )
                ),
                //build membership
              ],
            )
            //how to gain xp?
          )
        ]
      ),
    );
  }
}

Center placeholder = Center(
    child: Text(
      'Our Bean',
      style: TextStyle(fontSize: 24),
    )
);