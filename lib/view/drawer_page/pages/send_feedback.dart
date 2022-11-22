import 'package:flutter/material.dart';

class SendFeedback extends StatelessWidget {
  const SendFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Feedback'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
    );
  }
}