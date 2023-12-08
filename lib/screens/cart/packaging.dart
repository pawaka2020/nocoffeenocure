import 'package:flutter/material.dart';

class PackageItem {
  late String name;
  late double price;
  bool selected = false;

  PackageItem(this.name, this.price, this.selected);
}

class Packaging extends StatefulWidget {
  final Function(double, String, int) updatePackageDetails;
  List<bool> packageToggle;
  Packaging(this.packageToggle, this.updatePackageDetails);

  @override
  _PackagingState createState() => _PackagingState();
}

class _PackagingState extends State<Packaging> {
  late List<PackageItem> _packageItems;

  @override
  Widget build(BuildContext context) {
    _packageItems = [
      PackageItem("Straw", 0.50, widget.packageToggle[0]),
      PackageItem("Paperbag", 1.00, widget.packageToggle[1])
    ];

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Packaging"),
          buildSelectionRow(_packageItems[0], widget.updatePackageDetails, 0),
          buildSelectionRow(_packageItems[1], widget.updatePackageDetails, 1)
        ],
      ),
    );
  }

  Widget buildSelectionRow(PackageItem item, Function(double, String, int) updatePackageDetails, int index) {
    late double packagePrice;
    late String packageString;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Checkbox(
          value: item.selected,
          onChanged: (bool? value) {
            setState(() {
              if (value != null) {
                item.selected = value;
                packagePrice = setPackagePrice();
                packageString = setPackageString();
                updatePackageDetails(packagePrice, packageString, index);
              }
            });
          },
        ),
        Text(
          item.name,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'RM ${item.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  // double setPackagePrice() {
  //   double packagePrice = 0;
  //   for (var item in _packageItems) {
  //     if (item.selected == true) packagePrice += item.price;
  //   }
  //
  //   return packagePrice;
  // }

  double setPackagePrice() {
    return _packageItems
        .where((item) => item.selected)
        .fold(0, (double sum, item) => sum + item.price);
  }

  String setPackageString() {
    return _packageItems
        .where((item) => item.selected)
        .map((item) => "${item.name} : RM ${item.price.toStringAsFixed(2)}")
        .join('\n');
  }
}