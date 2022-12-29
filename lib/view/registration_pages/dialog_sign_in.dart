import 'package:chem_x/Controller/auth.dart';
import 'package:chem_x/main.dart';
import 'package:chem_x/view/registration_pages/dialog_forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';

import '../../Controller/chem_provider.dart';
import '../../controller/theme_service.dart';

class DialogSignIn extends StatefulWidget {
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
        insetPadding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
        child: Container(
          padding: EdgeInsets.only(top: 3.h,bottom: 3.h,right: 7.w,left:7.w),
          width: double.infinity,
          decoration: BoxDecoration(
              color:  ThemeService().getThemeMode() == ThemeMode.light? Colors.white: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Row(
                textDirection: languages.getMyLanguages() == 'EN'? TextDirection.ltr: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(Icons.mail_sharp,
                      color: ThemeService().getThemeMode() == ThemeMode.light? Colors.black: Colors.white,),
                  ),
                  Text(
                    languages.dialogSigninWithEmail(),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: ThemeService().getThemeMode() == ThemeMode.light? Colors.black: Colors.white,
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
              // SizedBox(
              //   height: 3.h,
              // ),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ForgotPassword();
                        });
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => const ForgotPassword()));
                    // Navigator.pushReplacement(context, ForgotPassword());
                  },
                  child: Text(
                    languages.dialogForgotPassword(),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: ThemeService().getThemeMode() == ThemeMode.light? Colors.black: Colors.white,
                          fontSize: 13.0.sp,
                        )),
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeService().getThemeMode() == ThemeMode.light? HexColor("#192A51"): HexColor("#849ED9"),
                    shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0))),
                onPressed: () {
                  if(_emailSignInDialogKey.currentState != null && _passwordSignInDialogKey.currentState != null) {
                    if (_emailSignInDialogKey.currentState!.validate() &&
                        _passwordSignInDialogKey.currentState!.validate()) {
                      Navigator.of(context).pop();
                      AuthO().signInWithEmailAndPassword(context,
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
  return Directionality(
    textDirection: languages.getMyLanguages() == 'EN'? TextDirection.ltr: TextDirection.rtl,
    child: TextFormField(
      textDirection: languages.getMyLanguages() == 'EN'? TextDirection.ltr: TextDirection.rtl,
      obscureText: validator=="Password"? true :false,
controller: controller,
      style: TextStyle(color: ThemeService().getThemeMode() == ThemeMode.light? Colors.black: Colors.white),
      key: keyy,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 3.w),
        label: Text(lable,style: TextStyle(fontSize: 10.sp,
          color: ThemeService().getThemeMode() == ThemeMode.light? Colors.black: Colors.white,
        )),
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
      // validator: (text) {
      //   if (validator == "UserName") {
      //
      //     if (text == null) {
      //       return "please fill this field ";
      //     } else if (text.isEmpty) {
      //       return "please fill this field ";
      //     } else if (!isAlpha(text)) {
      //       return "User Name must not contain numbers";
      //     }
      //   } else if (validator == "Email") {
      //
      //     if (text == null) {
      //       return "please fill this field ";
      //     } else if (text.isEmpty) {
      //       return "please fill this field ";
      //     } else if (!isEmail(text)) {
      //       return "Please enter a valid email";
      //     }
      //   } else if (validator == "Password") {
      //     if (text == null) {
      //       return "please fill this field ";
      //     } else if (text.isEmpty) {
      //       return "please fill this field ";
      //     } else if (text.length < 6 ||
      //         RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      //             .hasMatch(text)) {
      //       print("i will cum my password22");
      //       return "The password must be greater than 6 characters and contain an uppercase letter, lowercase letter and a symbol ";
      //     }
      //   }
      //   return null;
      // },
    ),
  );
}
