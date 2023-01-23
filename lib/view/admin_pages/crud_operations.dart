// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:chem_x/view/admin_pages/read_quizzes.dart';
import 'package:chem_x/view/admin_pages/update_quiz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import '../../../view_model/theme_service.dart';
import '../../view_model/admin_firebase_crud.dart';
import 'create_quiz.dart';
import 'package:chem_x/view/periodic_table_pages/home_page.dart' as colors;

class CRUDPage extends StatefulWidget {
  String categoryName;

  CRUDPage({Key? key, required this.categoryName}) : super(key: key);

  @override
  _CRUDPageState createState() => _CRUDPageState();
}

class _CRUDPageState extends State<CRUDPage> {
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readElement();
  String myColor = "#00000";
  List<dynamic> _itemsToDesplay = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
            ? Colors.white
            : Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        shadowColor: Colors.black,
        centerTitle: true,
        title: Text("Quizzes for ${widget.categoryName}",
            style: const TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
          //   Navigator.push(
          //       // context,
          //       // MaterialPageRoute(
          //       //     builder: (context) => CRUDOperations()
          //       // ));
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateQuiz(category: widget.categoryName)));

                // Navigator.pushAndRemoveUntil<dynamic>(
                //   context,
                //   MaterialPageRoute<dynamic>(
                //     builder: (BuildContext context) =>
                //         CreateQuiz(category: widget.categoryName),
                //   ),
                //       (route) =>
                //   false, //if you want to disable back feature set to false
                // );
              },
              icon: const Icon(Icons.add),
              color: Colors.black,
              iconSize: 30),
        ],
      ),
      body: StreamBuilder(
          stream: collectionReference,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView(
                  children: snapshot.data!.docs.map((e) {
                    if (e["element_category"] == widget.categoryName) {
                      return Container(

                        alignment: Alignment.center,
                        height: 15.h,
                          child: Card(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                SizedBox(
                                  height: 8.h,
                                  child: ListTile(
                                    title: Text(
                                        "This quiz for '" + e["element_correct_answer"] +
                                            "' element"),
                                    trailing: myPopUpMenuWidget(
                                        e["element_question"], e["element_correct_answer"], e["element_id"],
                                        e["element_answer_two"], e["element_answer_three"], e["element_answer_four"],
                                        context),
                                    leading: viewElementDesgin(
                                        widget.categoryName, e["element_correct_answer"]),
                                  ),
                                ),
                              ])),
                      );
                    }
                    return Container();
                  }).toList(),
                ),
              );
            }
            return Container(alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  myPopUpMenuWidget(String elementQuestion, String elementCorrectAnswer, String idElement,
      String elementAnswerTwo, String elementAnswerThree, String elementAnswerFour, BuildContext context) {
    return PopupMenuButton(itemBuilder: (context) {
      return [
        PopupMenuItem<int>(
            value: 0,
            child: Row(
              children: [
                Icon(Icons.remove_red_eye),
                SizedBox(width: 5),
                Text("View"),
              ],
            )),
        PopupMenuItem<int>(
            value: 1,
            child: Row(
              children: [
                Icon(Icons.edit),
                SizedBox(width: 5),
                Text("Edit"),
              ],
            )),
        PopupMenuItem<int>(
          value: 2,
          child: Row(
            children: [Icon(Icons.delete), SizedBox(width: 5), Text("Delete")],
          ),
        ),
      ];
    }, onSelected: (value) async {
      if (value == 0) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ReadQuizzes(
                      summary: elementQuestion,
                      name: elementCorrectAnswer,
                    )));
      } else if (value == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    UpdateQuiz(
                      idForElement: idElement,
                      elementCategory: widget.categoryName,
                      elementQuestion: elementQuestion,
                      elementAnswer: elementCorrectAnswer,
                      elementAnswerTwo: elementAnswerTwo,
                      elementAnswerThree: elementAnswerThree,
                      elementAnswerFour: elementAnswerFour,
                    )));

      } else if (value == 2) {
          var response =
              await FirebaseCrud.deleteElement(elementId: idElement);
          if (response.code != 200) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content:
                    Text(response.message.toString()),
                  );
                });

        }
      }
    });
  }

  viewElementDesgin(String categoryName, String elementName) {
    myColor = "#00000";
    switch (categoryName) {
      case "noble gas":
        myColor = colors.noble_gases;
        break;
      case "diatomic nonmetal":
        myColor = colors.reactive_nonmetals;
        break;
      case "polyatomic nonmetal":
        myColor = colors.reactive_nonmetals;
        break;
      case "metalloid":
        myColor = colors.metalloids;
        break;
      case "post-transition metal":
        myColor = colors.post_transition_metals;
        break;
      case "unknown, probably transition metal":
        myColor = colors.unknown_properties;
        break;
      case "alkali metal":
        myColor = colors.alkali_metals;
        break;
      case "alkaline earth metal":
        myColor = colors.alkaline_earth_metals;
        break;
      case "transition metal":
        myColor = colors.transition_metals;
        break;
      case "actinide":
        myColor = colors.actinides;
        break;
      case "lanthanide":
        myColor = colors.lanthanides;
        break;
    }
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 15.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: HexColor(myColor), width: 1.5),
          color: HexColor(myColor),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              HexColor(myColor).withOpacity(0.9),
              HexColor(myColor).withOpacity(0.6)
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 5.0,
            ),
          ],
        ),
        alignment: Alignment.center,
        child:
        Text(elementName,
            style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white)),


      ),
    );
  }
}
