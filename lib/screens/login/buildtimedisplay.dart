import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common.dart';

Stream<int> timerStream(int duration) {
  StreamController<int> controller = StreamController<int>();
  int currentDuration = duration;

  Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {
    controller.sink.add(currentDuration);
    if (currentDuration <= 0) {
      timer.cancel();
      controller.close();
    } else {
      currentDuration--;
    }
  });
  return controller.stream;
}

Widget buildTimerDisplay() {
  int timerDuration = 15; // Default timer duration in seconds

  return StreamBuilder<int>(
    stream: timerStream(timerDuration),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        int seconds = snapshot.data!;
        if (seconds > 0) {
          int minutes = seconds ~/ 60;
          int remainingSeconds = seconds % 60;
          String timerText =
              'Resend Code in ${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
          return Align(
              alignment: Alignment.center,
              child: Text(
                timerText,
                style: TextStyle(
                  fontSize: 12,
                ),
              )
          );
        }
        else {
          return GestureDetector(
              onTap: () {
                printToast("Code resent");
              },
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Resend Code',
                  style: TextStyle(
                      fontSize: 12,
                      //fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      decoration: TextDecoration.underline
                  ),
                ),
              )
          );
        }
      }
      else {
        return Align(
            alignment: Alignment.center,
            child: Text('',
                style: TextStyle(fontSize:12))
        );
      }
    },
  );
}