// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Controller/chem_provider.dart';
import '../../Module/single_element_data.dart';
import '../../View/admin_pages/crud_operations.dart';
import '../../controller/admin_firebase_crud.dart';
import '../../controller/theme_service.dart';
import '../../main.dart';
import '../quizzes_pages/quiz_category_page.dart';
import 'admin_select_category.dart';

Myelements? updateJson;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection =
    _firestore.collection('admin_CRUD_operations');

class UpdateQuiz extends StatefulWidget {
  String idForElement;
  String elementCategory;
  String elementQuestion;
  String elementAnswer;
  String elementAnswerTwo;
  String elementAnswerThree;
  String elementAnswerFour;



  UpdateQuiz(
      {Key? key,
      required this.elementAnswer,
      required this.elementQuestion,
      required this.elementCategory,
      required this.idForElement,
        required this.elementAnswerTwo,
        required this.elementAnswerThree,
        required this.elementAnswerFour,
      })
      : super(key: key);

  @override
  _UpdateQuizState createState() => _UpdateQuizState();
}

class _UpdateQuizState extends State<UpdateQuiz> {
  TextEditingController editQuestionController = TextEditingController();
  TextEditingController editAnswerController = TextEditingController();
  TextEditingController editAnswerTwoController = TextEditingController();
  TextEditingController editAnswerThreeController = TextEditingController();
  TextEditingController editAnswerFourController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override

  void initState() {
    super.initState();
    // Step 2 <- SEE HERE
    editQuestionController.text = widget.elementQuestion;
    editAnswerController.text = widget.elementAnswer;
    editAnswerTwoController.text = widget.elementAnswerTwo;
    editAnswerThreeController.text = widget.elementAnswerThree;
    editAnswerFourController.text = widget.elementAnswerFour;
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
              ? Colors.white
              : Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          shadowColor: Colors.black,
          centerTitle: true,
          title: Row(children: [
            SizedBox(width: 15.w),
            const Text("Update Quiz", style: TextStyle(color: Colors.black)),
            SizedBox(width: 2.w),
            const Icon(Icons.edit, color: Colors.black),
          ]),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "What is the name of this chemical element?",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 15.0.sp,
                  )),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [],
                  ),
                ),
                myTextFieldUpdatedQuestionWidget(10, editQuestionController,
                    "Change Question", widget.elementQuestion),
                SizedBox(
                  height: 2.5.h,
                ),
                myTextFieldUpdatedAnswerWidget(
                    4, editAnswerController, "Change Correct Answer", widget.elementAnswer),
                SizedBox(
                  height: 2.h,
                ),
                myTextFieldUpdatedAnswerTwoWidget(
                    4, editAnswerTwoController, "Change Answer Two", widget.elementAnswerTwo),
                SizedBox(
                  height: 2.h,
                ),
                myTextFieldUpdatedAnswerThreeWidget(
                    4, editAnswerThreeController, "Change Answer Three", widget.elementAnswerThree),
                SizedBox(
                  height: 2.h,
                ),
                myTextFieldUpdatedAnswerFourWidget(
                    4, editAnswerFourController, "Change Answer Four", widget.elementAnswerFour),
                SizedBox(
                  height: 5.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ThemeService().getThemeMode() == ThemeMode.light
                              ? HexColor("#192A51")
                              : HexColor("#849ED9"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0))),
                  onPressed: () async {
                    DocumentReference documentReferencer = _Collection.doc();
                    //
                    if (_formKey.currentState!.validate()) {
                      var response = await FirebaseCrud.updateElement(
                          elementID: widget.idForElement,
                        elementCategory: widget.elementCategory.toString(),
                        elementQuestion: editQuestionController.text,
                        elementsCorrectAnswer: editAnswerController.text,
                        elementAnswerTwo: editAnswerTwoController.text,
                        elementAnswerThree: editAnswerThreeController.text,
                        elementAnswerFour: editAnswerFourController.text,

                          // name: editAnswerController.text,
                          // category: widget.category,
                          // summary: editQuestionController.text
                      );
                      if (response.code != 200) {
                        print(widget.idForElement);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(response.message.toString()),
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(response.message.toString()),
                              );
                            });
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  CRUDPage(categoryName: widget.elementCategory)
                          ));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      languages.profileSaveChanges(),
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 15.sp,
                      )),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      languages.profileCancelChanges(),
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: ThemeService().getThemeMode() == ThemeMode.light
                            ? HexColor("#B90000")
                            : Colors.redAccent,
                        fontSize: 14.sp,
                      )),
                    )),
              ],
            ),
          ),
        ));
  }

  Widget myTextFieldUpdatedQuestionWidget(
      int maxValue,
      TextEditingController myController,
      String myMessage,
      String initialText) {
    return TextFormField (
      controller: myController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textInputAction: TextInputAction.done,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontSize: 15.0.sp,
      )),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        label: Text(myMessage, style: const TextStyle(fontSize: 15)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }


  Widget myTextFieldUpdatedAnswerWidget(
      int maxValue,
      TextEditingController myController,
      String myMessage,
      String initialText) {
    return TextFormField(
      controller: myController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textInputAction: TextInputAction.done,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 15.0.sp,
          )),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        label: Text(myMessage, style: const TextStyle(fontSize: 15)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget myTextFieldUpdatedAnswerTwoWidget(
      int maxValue,
      TextEditingController myController,
      String myMessage,
      String initialText) {
    return TextFormField(
      controller: myController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textInputAction: TextInputAction.done,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 15.0.sp,
          )),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        label: Text(myMessage, style: const TextStyle(fontSize: 15)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget myTextFieldUpdatedAnswerThreeWidget(
      int maxValue,
      TextEditingController myController,
      String myMessage,
      String initialText) {
    return TextFormField(
      controller: myController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textInputAction: TextInputAction.done,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 15.0.sp,
          )),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        label: Text(myMessage, style: const TextStyle(fontSize: 15)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget myTextFieldUpdatedAnswerFourWidget(
      int maxValue,
      TextEditingController myController,
      String myMessage,
      String initialText) {
    return TextFormField(
      controller: myController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textInputAction: TextInputAction.done,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 15.0.sp,
          )),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        label: Text(myMessage, style: const TextStyle(fontSize: 15)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
