import 'package:flutter/material.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Language',
          style: TextStyle(fontSize: 100),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
    );
  }
}
