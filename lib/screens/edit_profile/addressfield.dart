import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddressField extends StatefulWidget {
  String address;
  bool onsitePickup;
  Function(String) onSpecialRequestChanged;
  Function(bool) updateOnsitePickup;
  AddressField(this.address, this.onsitePickup, this.onSpecialRequestChanged, this.updateOnsitePickup);

  @override
  _AddressFieldState createState() => _AddressFieldState();
}

class _AddressFieldState extends State<AddressField> {

  static const String storeAddress =
      'COFFEE FANS SDN BHD (M) C-02-10, Ten Kinrara, Jalan BK 5a/3a, Bandar Kinrara, 47180 Puchong, Selangor';
  Color fainterGray = Colors.transparent;

  List<String> _autocompleteResults = [];
  bool _isLoading = false;
  Timer? _debounce;
  late TextEditingController _addressController;

  @override
  Widget build(BuildContext context) {
    bool _onSitePickup = widget.onsitePickup;
    String _userInput = widget.address;
    _addressController =
        TextEditingController(text: _userInput);
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Address"),
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
                    _userInput = value;
                    if (_debounce != null) {
                      _debounce!.cancel();
                    }
                    _debounce = Timer(Duration(seconds: 2), () {
                      // Call updateAddress to fetch autocomplete results
                      updateAddress(value);
                    });
                  },
                  style: TextStyle(
                    fontSize: 12,
                    //color: _onSitePickup ? Colors.grey : Colors.blue,
                    color: Colors.blue,
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
                FocusScope.of(context).unfocus();

                widget.updateOnsitePickup(value);
                widget.onSpecialRequestChanged(_addressController.text);
                _autocompleteResults = [];
              }
            });
          }),
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
          "Set as delivery address",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        //Spacer(),
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