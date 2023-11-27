import 'package:flutter/material.dart';

class PackageItem {
  late String name;
  late double price;
  bool selected = false;

  PackageItem(this.name, this.price);
}

class Packaging extends StatefulWidget {
  final Function(double, String) updatePackageDetails;
  Packaging(this.updatePackageDetails);

  @override
  _PackagingState createState() => _PackagingState();
}

class _PackagingState extends State<Packaging> {
  List<PackageItem> _packageItems = [
    PackageItem("Straw", 0.50),
    PackageItem("Paperbag", 1.00)
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Packaging"),
          for (var item in _packageItems)
            buildSelectionRow(item, widget.updatePackageDetails),
        ],
      ),
    );
  }

  Widget buildSelectionRow(PackageItem item, Function(double, String) updatePackageDetails) {
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
                updatePackageDetails(packagePrice, packageString);
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