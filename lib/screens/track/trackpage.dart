import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nocoffeenocure/screens/track/tracklocation.dart';
//import 'package:timelines/timelines.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'orderdetails.dart';

enum timelineType {
  start,
  between,
  end,
}

List<String> phase = [
  "Order Confirmed",
  "Preparing",
  "Out for Delivery",
  "Ready for Pickup",
  "Arrived",
  "Completed"
];

enum orderType {
  delivery,
  pickup
}

Widget buildTimeLine(IconData icon, Color iconColor, String label,
    String subLabel, Color timelineColor, bool isFirst, bool isLast) {
  return TimelineTile(
    isFirst: isFirst,
    isLast: isLast,
    beforeLineStyle: LineStyle(color: timelineColor),
    afterLineStyle: LineStyle(color: timelineColor),
    indicatorStyle: IndicatorStyle(
      width: 20,
      color: timelineColor, // Set the color to blue
      padding: EdgeInsets.all(4),
    ),
    endChild: Container(
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      child: Row(
        children: [
          SizedBox(width: 16),
          Icon(icon, color: iconColor, size: 30), // 30 or 40
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  subLabel,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildTimeLine2(int phaseIndex, timelineType type, int currentPhaseIndex) {
  const Color paleWhite = Color(0xFFE8E8E8);
  String label = phase[phaseIndex];
  late IconData icon;
  late Color iconColor;
  late String subLabel;
  late Color textColor = Colors.black;
  late bool isFirst;
  late bool isLast;
  Color timelineColor = paleWhite;
  switch (phaseIndex) {
    case 0:
      icon = Icons.check;
      iconColor = Colors.green;
      subLabel = 'We have received your order';
      break;
    case 1:
      icon = Icons.access_time;
      iconColor = Colors.yellow;
      subLabel = 'We are currently preparing your order';
      break;
    case 2:
      icon = Icons.motorcycle;
      iconColor = Colors.blue;
      subLabel = 'Your order is being delivered to your doorstep';
      break;
    case 3:
      icon = Icons.shopping_bag;
      iconColor = Colors.black26;
      subLabel = 'Your order is ready for pickup';
      break;
    case 4:
      icon = Icons.location_on;
      iconColor = Colors.red;
      subLabel = 'Your order has arrived';
      break;
    case 5:
      icon = Icons.done_all;
      iconColor = Colors.green;
      subLabel = 'Your order has been delivered';
      break;
  }
  if (currentPhaseIndex >= phaseIndex) {
    timelineColor = Colors.orange;
  }
  else {
    timelineColor = paleWhite;
    iconColor = paleWhite;
    textColor = paleWhite;
  }
  if (type == timelineType.start) {
    isFirst = true;
    isLast = false;
  }
  else if (type == timelineType.between) {
    isFirst = false;
    isLast = false;
  }
  else if (type == timelineType.end) {
    isFirst = false;
    isLast = true;
  }
  return TimelineTile(
    isFirst: isFirst,
    isLast: isLast,
    beforeLineStyle: LineStyle(color: timelineColor),
    afterLineStyle: LineStyle(color: timelineColor),
    indicatorStyle: IndicatorStyle(
      width: 20,
      color: timelineColor, // Set the color to blue
      padding: EdgeInsets.all(4),
    ),
    endChild: Container(
      constraints: const BoxConstraints(
        minHeight: 80, //100
      ),
      child: Row(
        children: [
          SizedBox(width: 16),
          Icon(icon, color: iconColor, size: 30), // 30 or 40
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 16, color: textColor),
                ),
                Text(
                  subLabel,
                  style: TextStyle(fontSize: 12, color: textColor),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class TrackPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => TrackPageState();
}

class TrackPageState extends State<TrackPage> {
  late DateTime _eta;
  late DateTime _timer;
  late int _currentPhaseIndex;
  late orderType _type;

  @override
  Widget build(BuildContext context) {
    _currentPhaseIndex = 3;
    _type = orderType.delivery;

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
            child: ListView(
              children: [
                if (_type == orderType.pickup) ...[
                  buildTimeLine2(0, timelineType.start, _currentPhaseIndex),
                  buildTimeLine2(1, timelineType.between, _currentPhaseIndex),
                  buildTimeLine2(3, timelineType.between, _currentPhaseIndex),
                  buildTimeLine2(5, timelineType.end, _currentPhaseIndex),
                ]
                else ...[
                  buildTimeLine2(0, timelineType.start, _currentPhaseIndex),
                  buildTimeLine2(1, timelineType.between, _currentPhaseIndex),
                  buildTimeLine2(2, timelineType.between, _currentPhaseIndex),
                  buildTimeLine2(4, timelineType.between, _currentPhaseIndex),
                  buildTimeLine2(5, timelineType.end, _currentPhaseIndex),
                ],
              ],
            ),
          ),
        ),
        selectionButton(context),
        box(),
      ],
    );
  }
}

Widget box() {
  double _height = 100; //100

  return SizedBox(
    width: double.infinity,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(0),
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Container(
            height: _height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("ORDER NUMBER",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black
                        )
                      ),
                      Text("#48",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                          )
                      )
                    ]
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("ESTIMATED TIME",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                          )
                      ),
                      Text("00:30:00",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey
                          )
                      )
                    ]
                ),
              ]
            ),

            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text("Order number #2482011"),
            //     Text("Estimated time 30 minutes")
            //   ]
            // ),
          )
        )
      ),
  );
}

void cancelOrder() {}

Widget selectionButton(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
    child: Align(
      alignment: Alignment.topRight,
      child: PopupMenuButton<String>(
          icon: Icon(
          Icons.menu,
          color: Colors.orange,
          size: 40,
        ),
          onSelected: (value) {
          // Handle menu item selection
          switch (value) {
            case 'viewOrderDetails':
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OrderDetailsScreen(),
              ));
              print('View order details selected');
              break;
            case 'viewLocation':
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TrackLocationScreen(),
              ));
              print('View location selected');
              break;
            case 'cancelOrder':
              cancelOrder();
              print('Cancel order selected');
              break;
          }
        },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>
          [
            PopupMenuItem<String>(
              value: 'viewOrderDetails',
              child: Text('View order details'),
            ),
            PopupMenuItem<String>(
              value: 'viewLocation',
              child: Text('View location'),
            ),
            PopupMenuItem<String>(
              value: 'cancelOrder',
              child: Text('Cancel order'),
            ),
          ],
      )
    )
  );
}


