import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:chem_x/view/drawer_page/my_drawer.dart';
import 'package:chem_x/view/quizzes_pages/quiz_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../main.dart';
import '../../view_model/chem_provider.dart';
import '../../View/quizzes_pages/quiz_home_page.dart';
import '../../view_model/admin_firebase_crud.dart';
import '../../view_model/theme_service.dart';
import '../admin_pages/read_quizzes.dart';
import 'dialog_are_you_sure_you_want_to_get_out.dart';
import 'package:chem_x/view/periodic_table_pages/home_page.dart' as colors;


class QuizzesExamAdmin extends StatefulWidget {
  String category;

  QuizzesExamAdmin({
    required this.category,
  });

  @override
  _QuizzesExamAdminState createState() => _QuizzesExamAdminState();
}

class _QuizzesExamAdminState extends State<QuizzesExamAdmin>
    with SingleTickerProviderStateMixin {
  var textProvider;
  late PageController pageController;
  // late AnimationController _controller;
  var providerChem;
  var providerToGetinfoToDispose;
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readElement();
  String myColor = "#00000";

  void initState() {
    super.initState();
    pageController = PageController();
    // _controller = AnimationController(
    //   duration: const Duration(seconds: 120),
    //   vsync: this,
    // );
    // _controller.addListener(() {
    //   if (_controller.isCompleted) {
    //     Navigator.pop(context);
    //   }
    // });
    textProvider = Provider.of<TextProvider>(context, listen: false)
        .currentPageForExamPage = 0;
    providerChem = Provider.of<TextProvider>(context, listen: false)
        .isPressedButtonInQuizPageForA = false;
    providerChem = Provider.of<TextProvider>(context, listen: false)
        .isPressedButtonInQuizPageForB = false;
    providerChem = Provider.of<TextProvider>(context, listen: false)
        .isPressedButtonInQuizPageForC = false;
    providerChem = Provider.of<TextProvider>(context, listen: false)
        .isPressedButtonInQuizPageForD = false;
    // _controller.forward();
  }

  @override
  void didChangeDependencies() {
    providerToGetinfoToDispose =
        Provider.of<TextProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // if (_controller.isAnimating || _controller.isCompleted) {
    //   FirebaseController().addOrUpdateUserDataOdExams(widget.category,
    //       score: providerToGetinfoToDispose.pointsForTrueAnswers);
    //   _controller.dispose();
    // }
    pageController.dispose();
    super.dispose();
  }

  int x = Random().nextInt(118 - 0) + 0;

  Future<bool> _onBackPressed() async {
    final backButtonProvider =
        Provider.of<TextProvider>(context, listen: false);
    if (!backButtonProvider.onBackspacePressed) {
      return Future.value(false);
    }
    return showPopUpInExam(widget.category, context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
              ? Colors.white
              : Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          shadowColor: Colors.black,
          centerTitle: true,
          title:  Text(languages.quizzesQuickQuizzesTitle(),
              style: TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuizzesPage(categoryName: widget.category)
                  ));
              // Navigator.of(context).pop();
            },
          ),
        ),
          body: StreamBuilder(
              stream: collectionReference,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                int count = 0;
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListView(
                      children: snapshot.data!.docs.map((e) {
                        if (e["element_category"] == widget.category) {
                          var lastElement = "";
                          if (e["element_correct_answer"] != lastElement)
                            count++;
                          lastElement = e["element_correct_answer"];

                          return Container(
                            height: 12.h,
                            alignment: Alignment.center,
                            child: Card(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  SizedBox(
                                    height: 8.h,
                                    child: ListTile(
                                      leading: viewElementDesgin(
                                          widget.category, e["element_correct_answer"]),
                                      title: Text("Question no. ${count}",    style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 18,
                                            color: ThemeService().getThemeMode() == ThemeMode.light
                                                ? Colors.black
                                                : Colors.white,
                                          ))),
                                      trailing: InkWell(
                                          child: Text("attempt now",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blueAccent,
                                                      fontWeight: FontWeight.w500))),
                                          onTap: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ReadQuizzesFromAdmin(
                                                          elementQuestion:
                                                          e["element_question"],
                                                          elementAnswer: e[
                                                          "element_correct_answer"],
                                                          elementAnswerTwo: e[
                                                          "element_answer_two"],
                                                          elementAnswerThree: e[
                                                          "element_answer_three"],
                                                          elementAnswerFour: e[
                                                          "element_answer_four"],
                                                          elementCategory: e["element_category"],
                                                          // summary: e["element_question"],
                                                          // name: e["element_correct_answer"],
                                                        )));
                                          }),
                                      // myPopUpMenuWidget(
                                      //     e["summary_question"], e["element_name"], e["element_id"],
                                      //     context),
                                      // leading: viewElementDesgin(
                                      //     widget.category, e["element_name"]),
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
                return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              }));
  }

  myPopUpMenuWidget(String summaryElement, String nameElement, String idElement,
      BuildContext context) {
    return PopupMenuButton(itemBuilder: (context) {
      return [
        PopupMenuItem<int>(
            value: 0,
            child: Row(
              children: const [
                Icon(Icons.remove_red_eye),
                SizedBox(width: 5),
                Text("View"),
              ],
            )),
        PopupMenuItem<int>(
            value: 1,
            child: Row(
              children: const [
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
                builder: (context) => ReadQuizzes(
                      summary: summaryElement,
                      name: nameElement,
                    )));
      } else if (value == 1) {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             UpdateQuiz(
        //
        //               idForElement: idElement,
        //               summary: summaryElement,
        //               name: nameElement,
        //               category: widget.category,
        //             )));

      } else if (value == 2) {
        var response = await FirebaseCrud.deleteElement(elementId: idElement);
        if (response.code != 200) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(response.message.toString()),
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
        child: Text("??",
            style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }

}

