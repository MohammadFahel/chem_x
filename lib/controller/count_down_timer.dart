
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

    return Text('${timerText}', style: TextStyle(fontSize: 40, color: Colors.white),
    );
  }
}