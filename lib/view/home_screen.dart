import 'package:chem_x/Controller/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
       // child: Text("Hello ${FirebaseAuth.instance.currentUser!.displayName!}"),
        child:   ElevatedButton(
        style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all<Color>(HexColor("#192A51")),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0)))), onPressed: () {
          AuthO().signOutUser();
        }, child: Text("Sign Out"),
      ),
      )
    );
  }

}