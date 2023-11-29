import 'package:flutter/material.dart';

import '../../common.dart';

class DeliveryAddress extends StatefulWidget {
  Function(String) onSpecialRequestChanged;
  Function(bool) updateOnsitePickup;
  DeliveryAddress(this.onSpecialRequestChanged, this.updateOnsitePickup);

  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  String _address = ''; // Store the user's address
  bool _onSitePickup = false; // Toggle for on-site pickup
  static const String storeAddress = 'COFFEE FANS SDN BHD (M) C-02-10, Ten Kinrara, Jalan BK 5a/3a, Bandar Kinrara, 47180 Puchong, Selangor';
  Color fainterGray = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivery Address"),
          SizedBox(height: 10),
          Row(
            children: [
              InkWell(
                onTap: () {
                  // Implement logic to get user's current location address
                  // and update the _address field
                },
                child: Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 32,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  onChanged: widget.onSpecialRequestChanged,
                  style: TextStyle(
                    fontSize: 12,
                    color: _onSitePickup ? Colors.grey : Colors.blue,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  readOnly: _onSitePickup, // Make the text field read-only when on-site pickup is selected
                  controller: TextEditingController(text: _onSitePickup ? storeAddress : _address),
                ),
              ),
            ],
          ),
          buildSelectionRow(_onSitePickup, (bool? value) {
            setState(() {
              if (value != null) {
                _onSitePickup = value;
                widget.updateOnsitePickup(value);

                // If on-site pickup is selected, set the store address
                if (_onSitePickup) {
                  _address = storeAddress;
                } else {
                  // If on-site pickup is deselected, clear the text field
                  _address = '';
                }
              }
            });
          }),
        ],
      ),
    );
  }

  Row buildSelectionRow(bool selected, ValueChanged<bool?> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Checkbox(
          value: selected,
          onChanged: onChanged,
        ),
        Text(
          "On-site pickup",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        Spacer(),
      ],
    );
  }
}


