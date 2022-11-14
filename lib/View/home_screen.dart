import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageChemX extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return HomeChemX();
  }

}
class HomeChemX extends State<HomePageChemX>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: Text("Hello ${FirebaseAuth.instance.currentUser!.displayName!}"),
      ),

    );
  }

}