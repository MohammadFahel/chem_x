// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Countdown extends AnimatedWidget {
  Animation<int> animation;

  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    int minutes = clockTimer.inMinutes;
    int seconds = clockTimer.inSeconds.remainder(60);
    var timerText = '$minutes:${seconds.toString().padLeft(2, '0')}';

    return Text(
      timerText,
      style:  TextStyle(fontSize: 20.sp, color: Colors.white),
    );
  }
}
