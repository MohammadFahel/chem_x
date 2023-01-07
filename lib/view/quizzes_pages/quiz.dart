// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Controller/chem_provider.dart';

class Quiz extends StatefulWidget {
  String summary;
  int index;
  String name;
  List<String> options;
  PageController pageController;
  int currentPage;

  Quiz(
      {required this.summary,
      required this.index,
      required this.name,
      required this.options,
      required this.pageController,
      required this.currentPage});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int pointNumber = 0;
  Set<int> numbers = {0, 1, 2, 3};

// Convert the set to a list and shuffle it
  late List<int> shuffledNumbers = numbers.toList()..shuffle();

  @override
  Widget build(BuildContext context) {
    var providerChem = Provider.of<TextProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              widget.summary,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 15.0.sp,
              )),
            ),
            Text(
              "What is the name of this chemical element?",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 15.0.sp,
              )),
            ),
            SizedBox(
              height: 2.h,
            ),
            Consumer<TextProvider>(builder: (context, myData, child) {
              return SizedBox(
                height: 6.5.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        myData.isPressedButtonInQuizPageForA
                            ? HexColor("#192A51")
                            : HexColor("#D9D9D9"),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))),
                  onPressed: () => {
                    myData.changeColorOfButtonInQuizPageForTrue("A"),
                    myData.changeColorOfButtonInQuizPageForFalse("B"),
                    myData.changeColorOfButtonInQuizPageForFalse("C"),
                    myData.changeColorOfButtonInQuizPageForFalse("D"),
                    providerChem.quizAnswer(widget.options[shuffledNumbers[0]]),
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: HexColor("#192A51"),
                        child: Text(
                          "A",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        " " + widget.options[shuffledNumbers[0]],
                        style: TextStyle(
                            color: HexColor("#626262"), fontSize: 15.sp),
                      ),
                      const Spacer(),
                      myData.isPressedButtonInQuizPageForA
                          ? IconButton(
                              onPressed: () => {
                                    myData
                                        .changeColorOfButtonInQuizPageForFalse(
                                            "A")
                                  },
                              icon: const Icon(Icons.close_outlined))
                          : Container()
                    ],
                  ),
                ),
              );
            }),

            SizedBox(
              height: 2.h,
            ),
            Consumer<TextProvider>(builder: (context, myData, child) {
              return SizedBox(
                height: 6.5.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        myData.isPressedButtonInQuizPageForB
                            ? HexColor("#192A51")
                            : HexColor("#D9D9D9"),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))),
                  onPressed: () => {
                    myData.changeColorOfButtonInQuizPageForTrue("B"),
                    myData.changeColorOfButtonInQuizPageForFalse("A"),
                    myData.changeColorOfButtonInQuizPageForFalse("C"),
                    myData.changeColorOfButtonInQuizPageForFalse("D"),
                    providerChem.quizAnswer(widget.options[shuffledNumbers[1]]),
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: HexColor("#192A51"),
                        child: Text(
                          "B",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        " " + widget.options[shuffledNumbers[1]],
                        style: TextStyle(
                            color: HexColor("#626262"), fontSize: 15.sp),
                      ),
                      const Spacer(),
                      myData.isPressedButtonInQuizPageForB
                          ? IconButton(
                              onPressed: () => {
                                    myData
                                        .changeColorOfButtonInQuizPageForFalse(
                                            "B")
                                  },
                              icon: const Icon(Icons.close_outlined))
                          : Container()
                    ],
                  ),
                ),
              );
            }),
            SizedBox(
              height: 2.h,
            ),
            Consumer<TextProvider>(builder: (context, myData, child) {
              return SizedBox(
                height: 6.5.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        myData.isPressedButtonInQuizPageForC
                            ? HexColor("#192A51")
                            : HexColor("#D9D9D9"),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))),
                  onPressed: () => {
                    myData.changeColorOfButtonInQuizPageForTrue("C"),
                    myData.changeColorOfButtonInQuizPageForFalse("B"),
                    myData.changeColorOfButtonInQuizPageForFalse("A"),
                    myData.changeColorOfButtonInQuizPageForFalse("D"),
                    providerChem.quizAnswer(widget.options[shuffledNumbers[2]]),
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: HexColor("#192A51"),
                        child: Text(
                          "C",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        " " + widget.options[shuffledNumbers[2]],
                        style: TextStyle(
                            color: HexColor("#626262"), fontSize: 15.sp),
                      ),
                      const Spacer(),
                      myData.isPressedButtonInQuizPageForC
                          ? IconButton(
                              onPressed: () => {
                                    myData
                                        .changeColorOfButtonInQuizPageForFalse(
                                            "C")
                                  },
                              icon: const Icon(Icons.close_outlined))
                          : Container()
                    ],
                  ),
                ),
              );
            }),
            SizedBox(
              height: 2.h,
            ),
            Consumer<TextProvider>(builder: (context, myData, child) {
              return SizedBox(
                height: 6.5.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        myData.isPressedButtonInQuizPageForD
                            ? HexColor("#192A51")
                            : HexColor("#D9D9D9"),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))),
                  onPressed: () => {
                    myData.changeColorOfButtonInQuizPageForTrue("D"),
                    myData.changeColorOfButtonInQuizPageForFalse("B"),
                    myData.changeColorOfButtonInQuizPageForFalse("C"),
                    myData.changeColorOfButtonInQuizPageForFalse("A"),
                    providerChem.quizAnswer(widget.options[shuffledNumbers[3]]),
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: HexColor("#192A51"),
                        child: Text(
                          "D",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        " " + widget.options[shuffledNumbers[3]],
                        style: TextStyle(
                            color: HexColor("#626262"), fontSize: 15.sp),
                      ),
                      const Spacer(),
                      myData.isPressedButtonInQuizPageForD
                          ? IconButton(
                              onPressed: () => {
                                    myData
                                        .changeColorOfButtonInQuizPageForFalse(
                                            "D")
                                  },
                              icon: const Icon(Icons.close_outlined))
                          : Container()
                    ],
                  ),
                ),
              );
            }),
            // Spacer(),
            SizedBox(
              height: 2.h,
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: MaterialButton(
                onPressed: () => {
                  if (providerChem.answerInQuiz == widget.name)
                    {
                      providerChem.pointsForExam(),
                    },
                  if (widget.currentPage == 5)
                    {Navigator.pop(context)}
                  else
                    widget.pageController.jumpToPage(widget.currentPage + 1),
                  providerChem.changeColorOfButtonInQuizPageForFalse("D"),
                  providerChem.changeColorOfButtonInQuizPageForFalse("B"),
                  providerChem.changeColorOfButtonInQuizPageForFalse("C"),
                  providerChem.changeColorOfButtonInQuizPageForFalse("A"),
                },
                child: Container(
                  height: 7.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: HexColor("#D9D9D9"),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: Text(
                    widget.currentPage == 5 ? "SUBMIT" : "Next Question",
                    style:
                        TextStyle(color: HexColor("#192A51"), fontSize: 15.sp),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
