import 'package:chem_x/view/quizzes_pages/quiz_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'package:chem_x/view_model/firebase_controller.dart';
import '../../view_model/chem_provider.dart';
import '../../view_model/theme_service.dart';

showPopUpInExam(String category,BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
          child: Container(
            padding:
            EdgeInsets.only(top: 10, bottom: 10, right: 7, left: 7),
            width: double.infinity,
            decoration: BoxDecoration(
                color: ThemeService().getThemeMode() == ThemeMode.light? Colors.white: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(30)),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 0.2,
                width: double.infinity,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Text(
                  "Are you sure that you want to leave the exam, any answered question will be saved ?",
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: ThemeService().getThemeMode() == ThemeMode.light? Colors.grey.shade700: Colors.grey.shade400
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 6.0,
                        backgroundColor: ThemeService().getThemeMode() == ThemeMode.light? HexColor("#192A51"): HexColor("#849ED9"),
                      ),
                      child: Text(
                        "No",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                            )),
                      )),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        var provider=Provider.of<TextProvider>(context, listen: false);
                        FirebaseController().addOrUpdateUserDataOdExams(category,score: provider.pointsForTrueAnswers);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) => QuizzesPage(categoryName: category)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 6.0,
                        backgroundColor: ThemeService().getThemeMode() == ThemeMode.light? HexColor("#192A51"): HexColor("#849ED9"),
                      ),
                      child: Text(
                        "Yes",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                            )),
                      )),
                ),
              ]),

            ]),
          ),
        );
      });
}