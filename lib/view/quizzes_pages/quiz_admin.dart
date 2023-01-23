import 'dart:math';

import 'package:chem_x/view/quizzes_pages/quizzes_exam_from_admin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../view_model/chem_provider.dart';
import '../../view_model/count_down_timer.dart';
import '../../view_model/theme_service.dart';

class ReadQuizzesFromAdmin extends StatefulWidget {
  String elementQuestion;
  String elementAnswer;
  String elementAnswerTwo;
  String elementAnswerThree;
  String elementAnswerFour;
  String elementCategory;

  ReadQuizzesFromAdmin(
      {Key? key,
      required this.elementQuestion,
      required this.elementAnswer,
      required this.elementAnswerTwo,
      required this.elementAnswerThree,
      required this.elementAnswerFour,
      required this.elementCategory})
      : super(key: key);

  @override
  _ReadQuizzesFromAdminState createState() => _ReadQuizzesFromAdminState();
}

class _ReadQuizzesFromAdminState extends State<ReadQuizzesFromAdmin>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 16),
      vsync: this,
    );
    _controller.addListener(() {
      if (_controller.isCompleted) {
        Navigator.pop(context);
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var providerChem = Provider.of<TextProvider>(context, listen: false);
    Set<String> answerOptions = {
      widget.elementAnswer.toString(),
      widget.elementAnswerTwo.toString(),
      widget.elementAnswerThree.toString(),
      widget.elementAnswerFour.toString()
    };
    late List<String> shuffledAnswers = answerOptions.toList()..shuffle();
    var answerOptionsList = [
      widget.elementAnswer.toString(),
      widget.elementAnswerTwo.toString(),
      widget.elementAnswerThree.toString(),
      widget.elementAnswerFour.toString()
    ];

    // final _random = new Random();
    // var randomlyAnswers = answerOptions[_random.nextInt(answerOptions.length)];

    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
        //       ? Colors.white
        //       : Colors.grey,
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        //   shadowColor: Colors.black,
        //   centerTitle: true,
        //   title: const Text("Select The Correct Answer", style: TextStyle(color: Colors.black)),
        //   leading: IconButton(
        //     icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ),
        body: Padding(
      padding: EdgeInsets.only(top: 5.h, right: 2.w, left: 2.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                height: 5.5.h,
                width: 30.w,
                decoration: BoxDecoration(
                    color: HexColor("#F87171"),
                    borderRadius: BorderRadius.circular(5)),
                child: Countdown(
                  animation: StepTween(
                    begin: 16,
                    end: 0,
                  ).animate(_controller),
                )),
            SizedBox(
              height: 1.w,
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            SizedBox(
              height: 3.w,
            ),

            Text(
              widget.elementQuestion,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 15.0.sp,
              )),
            ),
            // Text(
            //   "What is the name of this chemical element?",
            //   style: GoogleFonts.poppins(
            //       textStyle: TextStyle(
            //     fontSize: 15.0.sp,
            //   )),
            // ),
            SizedBox(height: 2.5.h),
            correctOptionForQuestion(
                "A", shuffledAnswers[0], 0, answerOptionsList, providerChem),
            SizedBox(height: 2.h),
            optionTwoForQuestion(
                "B", shuffledAnswers[1], 1, answerOptionsList, providerChem),
            SizedBox(height: 2.h),
            optionThreeForQuestion(
                "C", shuffledAnswers[2], 2, answerOptionsList, providerChem),
            SizedBox(height: 2.h),
            optionFourForQuestion(
                "D", shuffledAnswers[3], 3, answerOptionsList, providerChem),
            SizedBox(height: 2.5.h),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: MaterialButton(
                onPressed: () async => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizzesExamAdmin(
                              category: widget.elementCategory))),
                  if (providerChem.answerInQuiz == widget.elementAnswer)
                    {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              insetPadding: EdgeInsets.only(
                                  top: 175, right: 40, left: 40, bottom: 150),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset("assets/images/doneIcon.png",
                                      height: 40.h, width: 40.w),
                                  SizedBox(width: 50),
                                  Text("congratulations!",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 18.0.sp,
                                          color: Colors.black,
                                        ))),
                                  Text(
                                    "    Your Answer is Correct    ",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                      fontSize: 18.0.sp,
                                      color: Colors.black,
                                    )),
                                  ),

                                ],
                              ),
                            );
                          })
                    }
                  else
                    {
                  showDialog(
                  context: context,
                  builder: (context) {
                   return Dialog(
                      insetPadding: EdgeInsets.only(
                          top: 175, right: 40, left: 40, bottom: 150),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/canceled.png",
                              height: 40.h, width: 40.w),
                          SizedBox(width: 50),
                          Text("   The Correct Answer is:   ",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 18.0.sp,
                                    color: Colors.black,
                                  ))),
                          Text(
                            "${widget.elementAnswer}",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              fontSize: 18.0.sp,
                              color: Colors.black,
                            )),
                          ),
                        ],
                      ),
                    );
                  }
                  )
                    },
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
                    "SUBMIT",
                    style:
                        TextStyle(color: HexColor("#192A51"), fontSize: 15.sp),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  correctOptionForQuestion(String answerChoice, String answerText,
      int answerNumber, List answersList, TextProvider providerChem) {
    return Consumer<TextProvider>(builder: (context, myData, child) {
      return Container(
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
            providerChem.quizAnswer(answerText),
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: myData.isPressedButtonInQuizPageForA
                    ? HexColor("#D9D9D9")
                    : HexColor("#192A51"),
                child: Text(
                  "A",
                  style: TextStyle(
                      color: myData.isPressedButtonInQuizPageForA
                          ? HexColor("#192A51")
                          : Colors.white,
                      fontSize: 18.sp),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                answerText,
                style: TextStyle(color: HexColor("#626262"), fontSize: 15.sp),
              ),
              Spacer(),
              myData.isPressedButtonInQuizPageForA
                  ? IconButton(
                      onPressed: () =>
                          {myData.changeColorOfButtonInQuizPageForFalse("A")},
                      icon: Icon(Icons.close_outlined))
                  : Container()
            ],
          ),
        ),
      );
    });
  }

  optionTwoForQuestion(String answerChoice, String answerText, int answerNumber,
      List answersList, TextProvider providerChem) {
    return Consumer<TextProvider>(builder: (context, myData, child) {
      return Container(
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
            providerChem.quizAnswer(answerText),
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: myData.isPressedButtonInQuizPageForB
                    ? HexColor("#D9D9D9")
                    : HexColor("#192A51"),
                child: Text(
                  "B",
                  style: TextStyle(
                      color: myData.isPressedButtonInQuizPageForB
                          ? HexColor("#192A51")
                          : Colors.white,
                      fontSize: 18.sp),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                answerText,
                style: TextStyle(color: HexColor("#626262"), fontSize: 15.sp),
              ),
              Spacer(),
              myData.isPressedButtonInQuizPageForB
                  ? IconButton(
                      onPressed: () =>
                          {myData.changeColorOfButtonInQuizPageForFalse("B")},
                      icon: Icon(Icons.close_outlined))
                  : Container()
            ],
          ),
        ),
      );
    });
  }

  optionThreeForQuestion(String answerChoice, String answerText,
      int answerNumber, List answersList, TextProvider providerChem) {
    return Consumer<TextProvider>(builder: (context, myData, child) {
      return Container(
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
            providerChem.quizAnswer(answerText),
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: myData.isPressedButtonInQuizPageForC
                    ? HexColor("#D9D9D9")
                    : HexColor("#192A51"),
                child: Text(
                  "C",
                  style: TextStyle(
                      color: myData.isPressedButtonInQuizPageForC
                          ? HexColor("#192A51")
                          : Colors.white,
                      fontSize: 18.sp),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                answerText,
                style: TextStyle(color: HexColor("#626262"), fontSize: 15.sp),
              ),
              Spacer(),
              myData.isPressedButtonInQuizPageForC
                  ? IconButton(
                      onPressed: () =>
                          {myData.changeColorOfButtonInQuizPageForFalse("C")},
                      icon: Icon(Icons.close_outlined))
                  : Container()
            ],
          ),
        ),
      );
    });
  }

  optionFourForQuestion(String answerChoice, String answerText,
      int answerNumber, List answersList, TextProvider providerChem) {
    return Consumer<TextProvider>(builder: (context, myData, child) {
      return Container(
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
            providerChem.quizAnswer(answerText),
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: myData.isPressedButtonInQuizPageForD
                    ? HexColor("#D9D9D9")
                    : HexColor("#192A51"),
                child: Text(
                  "D",
                  style: TextStyle(
                      color: myData.isPressedButtonInQuizPageForD
                          ? HexColor("#192A51")
                          : Colors.white,
                      fontSize: 18.sp),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                answerText,
                style: TextStyle(color: HexColor("#626262"), fontSize: 15.sp),
              ),
              Spacer(),
              myData.isPressedButtonInQuizPageForD
                  ? IconButton(
                      onPressed: () =>
                          {myData.changeColorOfButtonInQuizPageForFalse("D")},
                      icon: Icon(Icons.close_outlined))
                  : Container()
            ],
          ),
        ),
      );
    });
  }
}
