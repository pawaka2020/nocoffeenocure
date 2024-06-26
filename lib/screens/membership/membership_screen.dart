import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

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

Widget buildLevelCard(String level, IconData icon, int currentPoints, int totalPoints,
String benefit1, String benefit2, String benefit3) {
  return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
              children: [
                Text(
                  level,
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
                      icon,
                      color: (currentPoints!= 0)? Colors.orange : Colors.grey,
                      size: 40,
                    ),
                    loadingBar(currentPoints, totalPoints),
                  ],
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Align(
                  alignment:Alignment.centerLeft,
                  child: Text(
                    benefit1 + '\n' + benefit2 + '\n' + benefit3,
                    textAlign:TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ]
          )
      )
  );
}

Widget buildCardLevelConnector() {
  return Column(
    children: [
      SizedBox(height: 5),
      Icon(
        Icons.keyboard_arrow_down,
        color: Colors.grey,
      ),
    ],
  );
}

Widget buildHowGetXPCard() => Card(
    elevation: 4.0,
    margin: EdgeInsets.symmetric(vertical: 8.0),
    child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("How to gain XP?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("- Daily check-ins [+2xp].",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("- Purchase of new items [+20xp].",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("- Writing reviews after purchase of new items [+4xp].",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("- Achieving milestones [+30 xp].",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ]
        )
    )
);

class MembershipScreen extends StatelessWidget {

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
                buildLevelCard('Level 1 : Coffee Taster', Icons.coffee_outlined, 55, 100,
                  '- Special 20% discount on the first coffee order.',
                  '- Access to discount vouchers.',
                  '- Free delivery on first 5 orders.'),
                buildCardLevelConnector(),
                buildLevelCard('Level 2 : Coffee Lover', Icons.coffee_maker, 0, 125,
                  '- 15% discount on all purchases.',
                  '- Early access to seasonal coffee offerings.',
                  '- Priority notification on new arrivals and popular blends.'),
                buildCardLevelConnector(),
                buildLevelCard('Level 3 - Coffee Connoisseur', Icons.coffee_maker, 0, 150,
                  '- Exclusive access to limited edition coffee blends.',
                  '- Early access to new coffee releases.',
                  '- Personalized recommendations based on taste preferences.'),
                buildCardLevelConnector(),
                buildLevelCard('Level 4 - Coffee Aficionado', Icons.coffee_maker, 0, 175,
                    '- 25% discount on all purchases.',
                    '- Free tasting and review on new coffee releases.',
                    '- Quarterly coffee tasting events with industry experts.'),
                buildCardLevelConnector(),
                buildLevelCard('Level 5 - Coffee Maestro', Icons.coffee_maker, 0, 200,
                    '- ???',
                    '- ???',
                    '- ???'),
                SizedBox(height: 10),
                buildHowGetXPCard(),
              ],
            )
          )
        ]
      ),
    );
  }
}