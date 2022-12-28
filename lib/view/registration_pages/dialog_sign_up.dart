import 'package:chem_x/Controller/auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';

import '../../controller/theme_service.dart';

class DialogSignUp extends StatelessWidget {
  final _emailSignUpDialogKey = GlobalKey<FormFieldState>();
  final _passwordSignUpDialogKey = GlobalKey<FormFieldState>();
  final _userNameSignUpDialogKey = GlobalKey<FormFieldState>();
  final userNameController = TextEditingController();
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
        backgroundColor: Colors.transparent,
        child: Container(
          padding:
              EdgeInsets.only(top: 3.h, bottom: 3.h, right: 7.w, left: 7.w),
          width: double.infinity,
          decoration: BoxDecoration(
              color: ThemeService().getThemeMode() == ThemeMode.light? Colors.white: Colors.black87,
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(Icons.mail_sharp),
                  ),
                  Text(
                    "Sign Up With Email",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
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
                  lable: "User Name",
                  keyy: _userNameSignUpDialogKey,
                  validator: "UserName",
                  controller: userNameController),
              SizedBox(
                height: 2.h,
              ),
              TextFieldWidget(
                  lable: "Email",
                  keyy: _emailSignUpDialogKey,
                  validator: "Email",
                  controller: emailController),
              SizedBox(
                height: 2.h,
              ),
              TextFieldWidget(
                  lable: "Password",
                  keyy: _passwordSignUpDialogKey,
                  validator: "Password",
                  controller: PasswordController),
              SizedBox(
                height: 3.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeService().getThemeMode() == ThemeMode.light? HexColor("#192A51"): HexColor("#849ED9"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                onPressed: () {

                  if (_userNameSignUpDialogKey.currentState != null &&
                      _emailSignUpDialogKey.currentState != null &&
                      _passwordSignUpDialogKey.currentState != null) {
                    if (_userNameSignUpDialogKey.currentState!.validate() &&
                        _emailSignUpDialogKey.currentState!.validate() &&
                        _passwordSignUpDialogKey.currentState!.validate()) {
                      Navigator.of(context).pop();
                      AuthO().createUserWithEmailAndPassword(context,
                          userName: userNameController.text,
                          email: emailController.text,
                          password: PasswordController.text);
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Sign Up",
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
                    "Cancel",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: ThemeService().getThemeMode() == ThemeMode.light? HexColor("#B90000"): Colors.redAccent,
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
  return TextFormField(
    obscureText: validator == "Password" ? true : false,
    controller: controller,
    style: TextStyle(color: ThemeService().getThemeMode() == ThemeMode.light? Colors.black: Colors.white),
    key: keyy,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
      label: Text(
        lable,
        style: TextStyle(fontSize: 10.sp),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeService().getThemeMode() == ThemeMode.light? Colors.black: Colors.white , width: 2),
          borderRadius: BorderRadius.circular(20)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeService().getThemeMode() == ThemeMode.light? Colors.black: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(20)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeService().getThemeMode() == ThemeMode.light? Colors.black: Colors.white),
          borderRadius: BorderRadius.circular(20)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeService().getThemeMode() == ThemeMode.light? Colors.black: Colors.white),
          borderRadius: BorderRadius.circular(20)),
    ),
    validator: (text) {
      if (validator == "UserName") {
        if (text == null) {
          return "please fill this field ";
        } else if (text.isEmpty) {
          return "please fill this field ";
        } else if (!isAlpha(text.replaceAll(' ', ''))) {
          return "User Name must be only litters";
        }
      } else if (validator == "Email") {
        if (text == null) {
          return "please fill this field ";
        } else if (text.isEmpty) {
          return "please fill this field ";
        } else if (!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(text)) {
          return "Please enter a valid email";
        }
      } else if (validator == "Password") {
        print(text);
        if (text == null) {
          return "please fill this field ";
        } else if (text.isEmpty) {
          return "please fill this field ";
        } else if (text.length <= 6) {
          return "The password must be greater than 6 characters";
        } else if (!RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)")
            .hasMatch(text)) {
          return "Must contain an uppercase, lowercase letter, symbol";
        }
      }
      return null;
    },
  );
}
