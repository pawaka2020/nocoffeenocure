import 'package:flutter/material.dart';

class Packaging extends StatefulWidget {
  final Function(int, bool, double) onSelectionChanged;

  Packaging(this.onSelectionChanged);

  @override
  _PackagingState createState() => _PackagingState();
}

class _PackagingState extends State<Packaging> {
  bool _strawSelected = false;
  bool _paperbagSelected = false;

  // void _handleStrawSelection(bool? value) {
  //   if (value != null) {
  //     setState(() {
  //       _strawSelected = value;
  //       widget.onSelectionChanged(_strawSelected, 0.5);
  //     });
  //   }
  // }
  //
  // void _handlePaperbagSelection(bool? value) {
  //   if (value != null) {
  //     setState(() {
  //       _paperbagSelected = value;
  //       widget.onSelectionChanged(_paperbagSelected, 10.0);
  //     });
  //   }
  // }

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
                widget. onSelectionChanged(0, value, 0.5);
              }
            });
          }),
          buildSelectionRow("Paperbag", 10.00, _paperbagSelected, (bool? value) {
            setState(() {
              if (value != null) {
                _paperbagSelected = value;
                widget. onSelectionChanged(1, value, 10.00);
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

// import 'package:flutter/material.dart';
//
// class Packaging extends StatefulWidget {
//   final Function(bool, double) onSelectionChanged;
//
//   Packaging(this.onSelectionChanged);
//
//   @override
//   _PackagingState createState() => _PackagingState();
// }
//
// class _PackagingState extends State<Packaging> {
//   bool _strawSelected = false;
//   bool _paperbagSelected = false;
//
//   void _handlePackageSelection(String type, double price, bool? value) {
//     bool toggle;
//     if (type == "Straw") toggle = _strawSelected;
//     else if (type == "Packaging") toggle = _paperbagSelected;
//
//     setState(() {
//       toggle = value!;
//       widget.onSelectionChanged(toggle, price);
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Packaging"),
//           // buildSelectionRow("Straw", 0.5, _strawSelected),
//           // buildSelectionRow("Paperbag", 10.00, _paperbagSelected),
//           buildSelectionRow("Straw", 0.5, _strawSelected, _handleStrawSelection),
//           buildSelectionRow("Paperbag", 10.00, _paperbagSelected, _handlePaperbagSelection),
//         ],
//       ),
//     );
//   }
//
//   Row buildSelectionRow(String title, double price, bool selected, ValueChanged<bool?> onChanged) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Checkbox(
//           value: selected,
//           onChanged: onChanged,
//         ),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 12,
//           ),
//         ),
//         Spacer(),
//         Align(
//           alignment: Alignment.centerRight,
//           child: Text(
//             'RM ${price.toStringAsFixed(2)}',
//             style: TextStyle(
//               fontSize: 12,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Row buildSelectionRow(String title, double price, bool selected) {
//   //   return Row(
//   //     mainAxisAlignment: MainAxisAlignment.end,
//   //     children: [
//   //       Checkbox(
//   //         value: selected,
//   //         onChanged:(value) {
//   //           _handlePackageSelection(title, price, value);
//   //         }
//   //       ),
//   //       Text(
//   //         title,
//   //         style: TextStyle(
//   //           fontSize: 12,
//   //         ),
//   //       ),
//   //       Spacer(),
//   //       Align(
//   //         alignment: Alignment.centerRight,
//   //         child: Text(
//   //           'RM ${price.toStringAsFixed(2)}',
//   //           style: TextStyle(
//   //             fontSize: 12,
//   //           ),
//   //         ),
//   //       ),
//   //     ],
//   //   );
//   // }
//
//   void _handleStrawSelection(bool? value) {
//     if (value != null) {
//       setState(() {
//         _strawSelected = value;
//         widget.onSelectionChanged(_strawSelected, 0.5);
//       });
//     }
//   }
//
//   void _handlePaperbagSelection(bool? value) {
//     if (value != null) {
//       setState(() {
//         _paperbagSelected = value;
//         widget.onSelectionChanged(_paperbagSelected, 10.0);
//       });
//     }
//   }
// }
//

