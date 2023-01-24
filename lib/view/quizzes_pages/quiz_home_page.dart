import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:chem_x/view/quizzes_pages/dialog_are_you_sure_you_want_to_get_out.dart';
import 'package:chem_x/view/quizzes_pages/quiz.dart';
import 'package:chem_x/view/quizzes_pages/quizzes_exam.dart';
import 'package:chem_x/view/quizzes_pages/quizzes_exam_from_admin.dart';
import 'package:chem_x/view/quizzes_pages/view_exam_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';

import '../../view_model/chem_provider.dart';
import '../../view_model/theme_service.dart';
import '../periodic_table_pages/home_page.dart';


class QuizzesPage extends StatefulWidget {
  String categoryName;

  QuizzesPage({Key? key, required this.categoryName}) : super(key: key);

  @override
  _QuizzesPageState createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController=AnimationController(vsync: this,duration:const Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    // RawKeyboard.instance.addListener(_handleKeyEvent);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<bool> _onBackPressed() async {
    final backButtonProvider =
    Provider.of<TextProvider>(context, listen: false);
    if (!backButtonProvider.onBackspacePressed) {
      return Future.value(false);
    }
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => PeriodicTableHomePage()),
          (route) => false,
    );
    return Future.value(false);
  }
  // DatabaseReference ref =
  // FirebaseDatabase.instance.ref(FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    // ref.onValue.listen((event) {
    //   Provider.of<TextProvider>(context, listen: false).userData =
    //   event.snapshot.value as Map;
    // });

    var textProvider = Provider.of<TextProvider>(context);
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PeriodicTableHomePage()),
                )),
            // centerTitle: true,
            backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
                ? Colors.white
                : Colors.grey.shade500,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            shadowColor: Colors.black,
            // elevation: 0.0,
            // title: Container(
            //   width: 5.5.w,
            //   height: 4.h,
            //   child: Image.asset("assets/images/flask.png"
            //     ,fit: BoxFit.fill,)),
          ),
          body: Consumer<TextProvider>(
            builder: (BuildContext context, value, Widget? child) {
              if(value.userData.containsKey(widget.categoryName)){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
                  child: Container(
                    width: double.infinity,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, top: 10),
                          child: Container(

                              width: 5.5.w,
                              height: 4.h,
                              child: Image.asset(
                                "assets/images/flask.png",
                                fit: BoxFit.fill,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h),
                          child: Text(
                            "Quizzes",
                            style: TextStyle(
                                fontSize: 12.sp, color: HexColor("#778198")),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Lottie.asset(
                            int.parse(value.userData[widget.categoryName]["score"]) >= 3?"assets/animation/congratulation-success-batch.json":"assets/animation/try-again.json",
                            controller:_animationController ,
                            width: double.infinity ,
                            height: 25.h ),

                        Text(
                            "Your score is "
                                "${value.userData[widget.categoryName]["score"]}/6 ",
                            style:TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.bold)

                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      HexColor("#192A51"))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          QuizzesExam(category: widget.categoryName),
                                    ));
                                textProvider.pointsForExamToZeroValue();
                              },
                              child: Text(
                                "Start Again",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      HexColor("#192A51"))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          QuizzesExamView(category: widget.categoryName),
                                    ));
                                textProvider.pointsForExamToZeroValue();
                              },
                              child: Text(
                                "View Results",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent)
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      QuizzesExamAdmin(category: widget.categoryName),
                                ));
                            // textProvider.pointsForExamToZeroValue();
                          },
                          child: Text(
                            "Try Quick Quizzes",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                );
              }else{
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
                  child: Container(
                    width: double.infinity,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, top: 10),
                          child: Container(

                              width: 5.5.w,
                              height: 4.h,
                              child: Image.asset(
                                "assets/images/flask.png",
                                fit: BoxFit.fill,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h),
                          child: Text(
                            "Quizzes",
                            style: TextStyle(
                                fontSize: 12.sp, color: HexColor("#778198")),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        Lottie.asset(
                            "assets/animation/chemical-test-tube.json",
                            controller:_animationController ,
                            width: double.infinity ,
                            height: 25.h ),
                        Text(
                          "You are attending the ${widget.categoryName} exam"
                          ,
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                              "Press the button to start the exam"
                              ,
                              style:TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.bold)

                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  HexColor("#192A51"))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      QuizzesExam(category: widget.categoryName),
                                ));
                            textProvider.pointsForExamToZeroValue();
                            textProvider.startedExam();
                          },
                          child: Text(
                            "Start",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                );
              }

            },
          ),
        ));
  }
}

// Future<void> readJson() async {
//   // Read the file
//   final String response =
//       await rootBundle.loadString("assets/data/quizzesData.json");
//   final data = await json.decode(response);
//   // Parse the JSON string into a dart object
//   return data;
// }

//
// Widget QuizzesList(String category) {
//   return FutureBuilder(
//       future: readJson(),
//       builder: (context, snapshot) {
//         // print(snapshot.data);
//         if (snapshot.hasData) {
//           var list = snapshot.data as Map;
//           List myList = list["myelements"];
//           List myList2 =
//               myList.where((user) => user["category"] == category).toList();
//           print(myList[0]["category"]);
//
//           // print(myList2[0][0]["category"]);
//           return Expanded(
//             child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   crossAxisSpacing: 8,
//                   mainAxisSpacing: 8,
//                 ),
//                 padding: EdgeInsets.zero,
//                 itemCount: myList2.length,
//                 itemBuilder: (context, index) {
//                   return MaterialButton(
//                     onPressed: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Quiz(
//                                   summary: myList2[index]["summary"],
//                                   index: index,
//                                   name: myList2[index]["name"],
//                                   options: [
//                                     myList2[index]["name"],
//                                     myList[Random().nextInt(118 - 0) + 0]
//                                         ["name"],
//                                     myList[Random().nextInt(118 - 0) + 0]
//                                         ["name"],
//                                     myList[Random().nextInt(118 - 0) + 0]
//                                         ["name"]
//                                   ])),
//                     ),
//                     child: elementForListQuizzes(index),
//                   );
//                 }),
//           );
//         } else {
//           return const CircularProgressIndicator();
//         }
//       });
// }

// Widget elementForListQuizzes(int index) {
//   return Container(
//     alignment: Alignment.center,
//     height: 9.h,
//     width: 20.w,
//     decoration: BoxDecoration(
//       color: HexColor("#D9D9D9"),
//       border: Border.all(
//         color: HexColor("#5181FB"),
//         width: 2,
//       ),
//       borderRadius: BorderRadius.circular(10.0),
//     ),
//     child:
//         // Row(
//         //   children: [
//         Text(
//       " Quiz ${index + 1}",
//       style: TextStyle(color: HexColor("#626262")),
//     ),
//     //   const Spacer(),
//     //    Icon(Icons.arrow_forward_ios_rounded,color: HexColor("#5181FB") ,)
//     //   // ],
//     // ),
//   );
// }