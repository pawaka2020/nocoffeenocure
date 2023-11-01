import 'package:flutter/material.dart';

class Packaging extends StatefulWidget {
  @override
  _PackagingState createState() => _PackagingState();
}

class _PackagingState extends State<Packaging> {
  bool _strawSelected = false;
  bool _paperbagSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Packaging"),
          buildSelectionRow("Straw", 0.5, _strawSelected, (bool? value) {
            setState(() {
              if (value != null) {
                _strawSelected = value;
              }
            });
          }),
          buildSelectionRow("Paperbag", 10.00, _paperbagSelected, (bool? value) {
            setState(() {
              if (value != null) {
                _paperbagSelected = value;
              }
            });
          }),
        ],
      ),
    );
  }

  Row buildSelectionRow(String title, double price, bool selected, ValueChanged<bool?> onChanged) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.end,
      children: [
        Checkbox(
          value: selected,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'RM ${price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}