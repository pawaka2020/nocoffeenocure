import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:timelines/timelines.dart';
import 'package:timeline_tile/timeline_tile.dart';

enum timelineType {
  start,
  between,
  end,
}
// enum deliveryPhase {
//   orderConfirmed,
//   preparing,
//   outForDelivery,
//   arrived,
//   readyPickup,
//   Completed,
// }

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
//
// Widget buildTimeLine2(int phaseIndex, timelineType type, int currentPhaseIndex) {
//   Color timelineColor  = (currentPhaseIndex <= phaseIndex)  ? Colors.orange : Colors.grey;
//   String label = phase[phaseIndex];
//   late IconData icon;
//   late Color iconColor;
//   late String subLabel;
//   switch (phaseIndex) {
//     case 0:
//       icon = Icons.check;
//       iconColor = Colors.green;
//       subLabel = 'We have received your order';
//       break;
//     case 1:
//       icon = Icons.access_time;
//       iconColor = Colors.yellow;
//       subLabel = 'We are currently preparing your order';
//       break;
//     case 2:
//       icon = Icons.motorcycle;
//       iconColor = Colors.blue;
//       subLabel = 'Your order is being delivered to your doorstep';
//       break;
//     case 3:
//       icon = Icons.location_on;
//       iconColor = Colors.red;
//       subLabel = 'Your order has arrived';
//       break;
//     case 4:
//       icon = Icons.shopping_bag;
//       iconColor = Colors.white;
//       subLabel = 'Your order is ready for pickup';
//       break;
//     case 5:
//       icon = Icons.location_on;
//       iconColor = Colors.red;
//       subLabel = 'Your order has arrived';
//       break;
//     case 6:
//       icon = Icons.done_all;
//       iconColor = Colors.green;
//       subLabel = 'Your order has been delivered';
//       break;
//   }
// }

Widget timelineTest4() {
  return Padding(
    padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    child: ListView(
      children: [
        buildTimeLine(Icons.check, Colors.green, 'Order Confirmed',
          'We have received your order', Colors.orange, true, false),
        buildTimeLine(Icons.access_time, Colors.orange, 'Preparing',
          'We are currently preparing your order', Colors.orange, false, false),
        buildTimeLine(Icons.motorcycle, Colors.blue, 'Out for Delivery',
          'Your order is being delivered to your doorstep', Colors.orange, false, false),
        buildTimeLine(Icons.location_on, Colors.red, 'Arrived',
          'Your order has arrived', Colors.orange, false, false),
        buildTimeLine(Icons.done_all, Colors.green, 'Completed',
          'Your order has been delivered', Colors.orange, false, true),
      ],
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
  late String _curentPhase;
  late orderType _type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: ListView(
        children: [
          buildTimeLine(Icons.check, Colors.green, 'Order Confirmed',
              'We have received your order', Colors.orange, true, false),
          buildTimeLine(Icons.access_time, Colors.orange, 'Preparing',
              'We are currently preparing your order', Colors.orange, false, false),
          buildTimeLine(Icons.motorcycle, Colors.blue, 'Out for Delivery',
              'Your order is being delivered to your doorstep', Colors.orange, false, false),
          buildTimeLine(Icons.location_on, Colors.red, 'Arrived',
              'Your order has arrived', Colors.orange, false, false),
          buildTimeLine(Icons.done_all, Colors.green, 'Completed',
              'Your order has been delivered', Colors.orange, false, true),
        ]
      )
    );
  }
}



Widget body() {
  return Center(
      child: Text(
        'Help me!',
        style: TextStyle(fontSize: 24),
      )
  );
}


