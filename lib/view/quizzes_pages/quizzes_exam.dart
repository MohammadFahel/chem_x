import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:chem_x/view/quizzes_pages/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/chem_provider.dart';
import '../../controller/count_down_timer.dart';
import '../../controller/theme_service.dart';

class QuizzesExam extends StatefulWidget {
  String category;

  QuizzesExam({
    required this.category,
  });

  @override
  _QuizzesExamState createState() => _QuizzesExamState();
}

class _QuizzesExamState extends State<QuizzesExam>
    with SingleTickerProviderStateMixin {
  var textProvider;
  late PageController pageController;
  late AnimationController _controller;
var providerChem;
  void initState() {
    super.initState();
    pageController = PageController();
    _controller = AnimationController(
      duration: const Duration(seconds: 120),
      vsync: this,
    );
    _controller.addListener(() {
      if (_controller.isCompleted) {
        Navigator.pop(context);
      }
    });
    textProvider = Provider.of<TextProvider>(context, listen: false).currentPageForExamPage=0;
    providerChem = Provider.of<TextProvider>(context, listen: false).isPressedButtonInQuizPageForA=false;
    providerChem = Provider.of<TextProvider>(context, listen: false).isPressedButtonInQuizPageForB=false;
    providerChem = Provider.of<TextProvider>(context, listen: false).isPressedButtonInQuizPageForC=false;
    providerChem = Provider.of<TextProvider>(context, listen: false).isPressedButtonInQuizPageForD=false;
    _controller.forward();
  }

  @override
  void dispose() {
    if (_controller.isAnimating || _controller.isCompleted)
      _controller.dispose();
    pageController.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       color: Colors.black,
        //       size: 30,
        //     ),
        //     onPressed: () => Navigator.pop(context),
        //   ),
        //   // centerTitle: true,
        //   backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
        //       ? Colors.white
        //       : Colors.grey.shade500,
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        //   shadowColor: Colors.black,
        //   // elevation: 0.0,
        //   // title: Container(
        //   //   width: 5.5.w,
        //   //   height: 4.h,
        //   //   child: Image.asset("assets/images/flask.png"
        //   //     ,fit: BoxFit.fill,)),
        // ),
        body: examsPages(
            widget.category, pageController, context, _controller, height));
  }
}

Future<void> readJson() async {
  // Read the file
  final String response =
      await rootBundle.loadString("assets/data/quizzesData.json");
  final data = await json.decode(response);
  // Parse the JSON string into a dart object
  return data;
}

Widget examsPages(String category, PageController pageController,
    BuildContext context, AnimationController _controller, double height) {
  var textProvider = Provider.of<TextProvider>(context, listen: false);
  print("1");
  return FutureBuilder(
      future: readJson(),
      builder: (context, snapshot) {
        // print(snapshot.data);
        if (snapshot.hasData) {
          var list = snapshot.data as Map;
          List myList = list["myelements"];
          List myList2 =
              myList.where((user) => user["category"] == category).toList();
          print(myList[0]["category"]);

          return Padding(
            padding:  EdgeInsets.only(top: 10.h,right: 2.w,left: 2.w),
            child: Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Consumer<TextProvider>(
                          builder: (context, myData, child) {
                        return Container(
                          alignment: Alignment.center,
                          height: 5.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: HexColor("#B3FBB6"),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Question ${myData.currentPageForExamPage + 1}",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              fontSize: 15.0.sp,
                            )),
                          ),
                        );
                      }),
                      Spacer(),
                      Container(
                          alignment: Alignment.center,
                          height: 5.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: HexColor("#F87171"),
                              borderRadius: BorderRadius.circular(5)),
                          child: Countdown(
                            animation: StepTween(
                              begin: 120,
                              end: 0,
                            ).animate(_controller),
                          ))
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  Expanded(

                    child: PageView(

                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: (num) {
                        textProvider.onPageExamChanged(num);
                      },
                      controller: pageController,
                      children: [
                        Quiz(
                          summary: myList2[0]["summary"],
                          index: 1,
                          name: myList2[0]["name"],
                          options: [
                            myList2[0]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"]
                          ],
                          pageController: pageController,
                          currentPage: 0,
                        ), // first quiz page
                        Quiz(
                          summary: myList2[1]["summary"],
                          index: 2,
                          name: myList2[1]["name"],
                          options: [
                            myList2[1]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"]
                          ],
                          pageController: pageController,
                          currentPage: 1,
                        ), // second quiz page
                        Quiz(
                          summary: myList2[2]["summary"],
                          index: 3,
                          name: myList2[2]["name"],
                          options: [
                            myList2[2]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"]
                          ],
                          pageController: pageController,
                          currentPage: 2,
                        ), //
                        Quiz(
                          summary: myList2[3]["summary"],
                          index: 4,
                          name: myList2[3]["name"],
                          options: [
                            myList2[3]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"]
                          ],
                          pageController: pageController,
                          currentPage: 3,
                        ),
                        Quiz(
                          summary: myList2[4]["summary"],
                          index: 5,
                          name: myList2[4]["name"],
                          options: [
                            myList2[4]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"]
                          ],
                          pageController: pageController,
                          currentPage: 4,
                        ),
                        Quiz(
                          summary: myList2[5]["summary"],
                          index: 6,
                          name: myList2[5]["name"],
                          options: [
                            myList2[5]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"],
                            myList[Random().nextInt(118 - 0) + 0]["name"]
                          ],
                          pageController: pageController,
                          currentPage: 5,
                        ), //// third quiz page
                      ],
                    ),
                  ),
                ]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}
