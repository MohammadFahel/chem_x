// ignore_for_file: must_be_immutable, prefer_const_constructors, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../controller/theme_service.dart';
import '../../../main.dart';

class SendFeedback extends StatelessWidget {
  final sendFeedbackController = TextEditingController();
  TextEditingController textAreaField = TextEditingController();

  SendFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Dialog(
        insetPadding: EdgeInsets.only(top: 75, right: 20, left: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
        child: Container(
          padding: EdgeInsets.only(top: 30, bottom: 30, right: 20, left: 20),
          width: double.infinity,
          decoration: BoxDecoration(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.white
                  : Colors.grey.shade900,
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                textDirection: languages.getMyLanguages() == 'EN'
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.send_outlined),
                  ),
                  Text(
                    languages.feedbackEditTitle(),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Directionality(
                textDirection: languages.getMyLanguages() == 'EN'
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: TextField(
                  controller: textAreaField,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: languages.feedbackHintMessage(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                ThemeService().getThemeMode() == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                            width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                ThemeService().getThemeMode() == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                            width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                ThemeService().getThemeMode() == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                ThemeService().getThemeMode() == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
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
                  DatabaseReference ref = FirebaseDatabase.instance
                      .ref("feedback Users")
                      .child(FirebaseAuth.instance.currentUser!.uid);
                  await ref.set({"feedback": textAreaField.text});
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    languages.feedbackSubmit(),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 17.5,
                    )),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    languages.feedbackCancel(),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: ThemeService().getThemeMode() == ThemeMode.light
                          ? HexColor("#B90000")
                          : Colors.redAccent,
                      fontSize: 17.5,
                    )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

Widget TextFieldWidget(
    {required String lable,
    required GlobalKey<FormFieldState> keyy,
    required String validator,
    required TextEditingController controller}) {
  return Directionality(
    textDirection: languages.getMyLanguages() == 'EN'
        ? TextDirection.ltr
        : TextDirection.rtl,
    child: TextFormField(
      obscureText: validator == "Password" ? true : false,
      controller: controller,
      style: TextStyle(color: Colors.red),
      key: keyy,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
        label: Text(
          lable,
          style: TextStyle(fontSize: 10),
        ),
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
    ),
  );
}
