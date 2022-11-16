import 'package:chem_x/Controller/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';

class DialogSignIn extends StatelessWidget {
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
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(top: 3.h,bottom: 3.h,right: 7.w,left:7.w),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(Icons.mail_sharp),
                  ),
                  Text(
                    "Sign In With Email",
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
                  lable: "Email",
                  keyy: _emailSignInDialogKey,
                  validator: "Email",
              controller: emailController),
              SizedBox(
                height: 2.h,
              ),
              TextFieldWidget(
                  lable: "Password",
                  keyy: _passwordSignInDialogKey,
                  validator: "Password",
              controller: PasswordController),
              SizedBox(
                height: 3.h,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(HexColor("#192A51")),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                onPressed: () {
                  if(_emailSignInDialogKey.currentState != null && _passwordSignInDialogKey.currentState != null) {
                    if (_emailSignInDialogKey.currentState!.validate() &&
                        _passwordSignInDialogKey.currentState!.validate()) {
                      Navigator.of(context).pop();
                      AuthO().signInWithEmailAndPassword(email: emailController.text,
                          password: PasswordController.text);

                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Sign In",
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
                          color: HexColor("#B90000"),
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

controller: controller,
    style: TextStyle(color: Colors.red),
    key: keyy,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 3.w),
      label: Text(lable,style: TextStyle(fontSize: 10.sp),),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(20)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(20)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(20)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(20)),
    ),
    validator: (text) {
      if (validator == "UserName") {

        if (text == null) {
          return "please fill this field ";
        } else if (text.isEmpty) {
          return "please fill this field ";
        } else if (!isAlpha(text)) {
          return "User Name must not contain numbers";
        }
      } else if (validator == "Email") {

        if (text == null) {
          return "please fill this field ";
        } else if (text.isEmpty) {
          return "please fill this field ";
        } else if (!isEmail(text)) {
          return "Please enter a valid email";
        }
      } else if (validator == "Password") {
        if (text == null) {
          return "please fill this field ";
        } else if (text.isEmpty) {
          return "please fill this field ";
        } else if (text.length < 6 ||
            RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                .hasMatch(text)) {
          print("i will cum my password22");
          return "The password must be greater than 6 characters and contain an uppercase letter, lowercase letter and a symbol ";
        }
      }
      return null;
    },
  );
}
