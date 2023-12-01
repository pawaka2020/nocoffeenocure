import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeliveryAddress extends StatefulWidget {
  Function(String) onSpecialRequestChanged;
  Function(bool) updateOnsitePickup;
  DeliveryAddress(this.onSpecialRequestChanged, this.updateOnsitePickup);

  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  String _userInput = ''; // Store the user's input in the TextField
  bool _onSitePickup = false; // Toggle for on-site pickup
  static const String storeAddress =
      'COFFEE FANS SDN BHD (M) C-02-10, Ten Kinrara, Jalan BK 5a/3a, Bandar Kinrara, 47180 Puchong, Selangor';
  Color fainterGray = Colors.transparent;

  List<String> _autocompleteResults = [];
  bool _isLoading = false;
  Timer? _debounce;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _addressController =
        TextEditingController(text: _onSitePickup ? storeAddress : _userInput);
  }

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
              Icon(
                Icons.location_on,
                color: Colors.blue,
                size: 32,
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _addressController,
                  onChanged: (value) {
                    // Store user input separately
                        _userInput = value;
                        widget.onSpecialRequestChanged(_userInput);
                        // Clear existing debounce timer
                        if (_debounce != null) {
                          _debounce!.cancel();
                        }
                        // Create a new debounce timer
                        _debounce = Timer(Duration(seconds: 2), () {
                          // Call updateAddress to fetch autocomplete results
                          updateAddress(value);
                        });

                  },
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
                  readOnly: _onSitePickup, // Make the text field read-only when on-site pickup is selecte
                ),
              ),
            ],
          ),
          buildSelectionRow(_onSitePickup, (bool? value) {
            setState(() {
              if (value != null) {
                _onSitePickup = value;

                // If on-site pickup is selected, set the store address
                if (_onSitePickup) {
                  _addressController.text = storeAddress;
                } else {
                  // If on-site pickup is deselected, clear the text field
                  _addressController.text = '';
                }

                // Unfocus the text field
                FocusScope.of(context).unfocus();

                widget.updateOnsitePickup(value);
                widget.onSpecialRequestChanged(_addressController.text);
                _autocompleteResults = [];
              }
            });
          }),
          SizedBox(height: 10),
          _isLoading
            ? Center(
            child: CircularProgressIndicator(),
          )
            : _autocompleteResults.isNotEmpty
                ? Container(
                    height: 200, // Set a fixed height for the ListView
                    child: ListView.builder(
                      itemCount: _autocompleteResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_autocompleteResults[index]),
                          onTap: () {
                    // Update the text field with the selected address
                    _addressController.text = _autocompleteResults[index];
                    widget.onSpecialRequestChanged(_addressController.text);
                    // Optionally, you can clear the autocomplete results after selecting
                    setState(() {
                      _autocompleteResults.clear();
                    });
                  },
                        );
                      },
                    ),
                  )
                : Container(),
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

  Future<void> updateAddress(String userInput) async {
    widget.onSpecialRequestChanged(userInput);
    setState(() {
      _isLoading = true;
    });

    final apiUrl =
        'https://nominatim.openstreetmap.org/search?format=json&q=$userInput&countrycodes=MY';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the JSON response and extract address names
        final List<dynamic> data = json.decode(response.body);
        List<String> addresses =
        data.map((result) => result['display_name'] as String).toList();
        setState(() {
          _autocompleteResults = addresses;
          _isLoading = false;
        });
      } else {
        // Handle API error
        throw Exception('Failed to load autocomplete results');
      }
    } catch (e) {
      // Handle network or parsing errors
      setState(() {
        _isLoading = false;
      });
      throw Exception('Error: $e');
    }
  }

  @override
  void dispose() {
    // Dispose the debounce timer to avoid memory leaks
    _debounce?.cancel();
    _addressController.dispose();
    super.dispose();
  }
}
