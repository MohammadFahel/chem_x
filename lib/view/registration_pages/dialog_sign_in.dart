// ignore_for_file: non_constant_identifier_names

import 'package:chem_x/Controller/firebase_controller.dart';
import 'package:chem_x/main.dart';
import 'package:chem_x/view/registration_pages/dialog_forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import '../../controller/theme_service.dart';

class DialogSignIn extends StatefulWidget {
  const DialogSignIn({Key? key}) : super(key: key);

  @override
  State<DialogSignIn> createState() => _DialogSignInState();
}

class _DialogSignInState extends State<DialogSignIn> {
  final _emailSignInDialogKey = GlobalKey<FormFieldState>();
  final _passwordSignInDialogKey = GlobalKey<FormFieldState>();
  final emailController = TextEditingController();
  final PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Dialog(
        insetPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
        child: Container(
          padding:
              EdgeInsets.only(top: 3.h, bottom: 3.h, right: 7.w, left: 7.w),
          width: double.infinity,
          decoration: BoxDecoration(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.white
                  : Colors.grey.shade900,
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Row(
                textDirection: languages.getMyLanguages() == 'EN'
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.mail_sharp,
                      color: ThemeService().getThemeMode() == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  Text(
                    languages.dialogSigninWithEmail(),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: ThemeService().getThemeMode() == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 15.0.sp,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 0.2.h,
                width: double.infinity,
                color: Colors.grey,
              ),
              SizedBox(
                height: 3.h,
              ),
              TextFieldWidget(
                  lable: languages.dialogSigninEmailHint(),
                  keyy: _emailSignInDialogKey,
                  validator: "Email",
                  controller: emailController),
              SizedBox(
                height: 2.h,
              ),
              TextFieldWidget(
                  lable: languages.dialogSigninPasswordHint(),
                  keyy: _passwordSignInDialogKey,
                  validator: "Password",
                  controller: PasswordController),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const ForgotPassword();
                        });
                  },
                  child: Text(
                    languages.dialogForgotPassword(),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: ThemeService().getThemeMode() == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 13.0.sp,
                    )),
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        ThemeService().getThemeMode() == ThemeMode.light
                            ? HexColor("#192A51")
                            : HexColor("#849ED9"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                onPressed: () {
                  if (_emailSignInDialogKey.currentState != null &&
                      _passwordSignInDialogKey.currentState != null) {
                    if (_emailSignInDialogKey.currentState!.validate() &&
                        _passwordSignInDialogKey.currentState!.validate()) {
                      Navigator.of(context).pop();
                      FirebaseController().signInWithEmailAndPassword(context,
                          email: emailController.text,
                          password: PasswordController.text);
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    languages.dialogSignin(),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 15.0.sp,
                    )),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    languages.dialogSigninCancel(),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: ThemeService().getThemeMode() == ThemeMode.light
                          ? HexColor("#B90000")
                          : Colors.redAccent,
                      fontSize: 15.0.sp,
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
      textDirection: languages.getMyLanguages() == 'EN'
          ? TextDirection.ltr
          : TextDirection.rtl,
      obscureText: validator == "Password" ? true : false,
      controller: controller,
      style: TextStyle(
          color: ThemeService().getThemeMode() == ThemeMode.light
              ? Colors.black
              : Colors.white),
      key: keyy,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
        label: Text(lable,
            style: TextStyle(
              fontSize: 10.sp,
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
            )),
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
