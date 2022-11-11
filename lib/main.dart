import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'View/sign_up_page.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return const MaterialApp(
      home: MyApp(),
    );
  }));
}