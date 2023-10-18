import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartialDivider extends StatelessWidget{
  final double pad;
  final double dividerHeight;
  PartialDivider(this.pad, this.dividerHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pad), // Adjust the padding as needed
      child: Divider(height: dividerHeight), //2
    );
  }
}
