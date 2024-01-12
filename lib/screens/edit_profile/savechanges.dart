import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common.dart';
import '../../main.dart';



Widget buildSaveChanges(BuildContext context,
    void Function(BuildContext context) saveChanges) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Card(
        elevation: 14,
        margin: EdgeInsets.all(0),
        child: Padding(
            padding: EdgeInsets.only(top:16, bottom: 16, left: 32, right: 32),
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //button
                      ElevatedButton(
                        onPressed: () {
                          saveChanges(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, ///Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Rounded button edges
                          ),
                        ),
                        child: Container(
                          width: double.infinity, // Occupy the maximum available width
                          child: Center(
                            child: Text(
                              "Save Changes",
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontSize: 16, // Text size
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                )
            )
        )
    ),
  );
}