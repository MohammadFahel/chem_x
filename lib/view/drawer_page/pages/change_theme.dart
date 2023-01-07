import 'package:flutter/material.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Theme'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
    );
  }
}
