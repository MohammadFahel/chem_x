// ignore_for_file: must_be_immutable

import 'package:chem_x/view/quizzes_pages/quizzes_exam.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Controller/chem_provider.dart';
import '../../controller/theme_service.dart';

class QuizzesPage extends StatefulWidget {
  String categoryName;

  QuizzesPage({Key? key, required this.categoryName}) : super(key: key);

  @override
  _QuizzesPageState createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  @override
  Widget build(BuildContext context) {
    var textProvider = Provider.of<TextProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        // centerTitle: true,
        backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
            ? Colors.white
            : Colors.grey.shade500,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        shadowColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5, top: 10),
                child: SizedBox(
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
                  style: TextStyle(fontSize: 12.sp, color: HexColor("#778198")),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 2,
              ),
              const Spacer(),
              Text(
                textProvider.pointsForTrueAnswers == 0
                    ? "You are attending the ${widget.categoryName} exam"
                    : "",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                textProvider.pointsForTrueAnswers == 0
                    ? "Press the button to start the exam"
                    : "Your score is "
                        "${textProvider.pointsForTrueAnswers}/6 ",
                style: textProvider.pointsForTrueAnswers > 0
                    ? TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)
                    : const TextStyle(),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(HexColor("#192A51"))),
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
                  textProvider.pointsForTrueAnswers > 0
                      ? "Start Again"
                      : "Start",
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
