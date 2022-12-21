import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:string_validator/string_validator.dart';
import 'package:chem_x/Controller/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final _auth = FirebaseAuth.instance.currentUser;

  final _usernameKey = GlobalKey<FormFieldState>();

  final _emailKey = GlobalKey<FormFieldState>();

  final _currentPasswordKey = GlobalKey<FormFieldState>();

  final _newPasswordKey = GlobalKey<FormFieldState>();

  final _againNewPasswordKey = GlobalKey<FormFieldState>();

  final userNameController = TextEditingController();

  final curruentPsswordController = TextEditingController();

  final passwordController = TextEditingController();

  final newPasswordController = TextEditingController();

  final againNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: SizedBox(
            height: 1,
          ),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        shadowColor: Colors.black,
        title: const Text("Edit Profile",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('assets/images/backbutton.png', width: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30),
                Image.asset("assets/images/editProfile.png", width: 100, height: 100),
                SizedBox(height: 15),
                Text("User Information",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 15.0,
                    ))),
                SizedBox(height: 15),
                FutureBuilder(
                    future: AuthO().getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data as Map;
                        return TextFieldWidget(
                          enable: false,
                          initialText: data["userName"],
                          lable: "User Name",
                          keyy: _usernameKey,
                          validator: "UserName",
                        );
                      } else {
                        return Text("No data");
                      }
                    }),

                SizedBox(height: 15),
                TextFieldWidget(
                  enable: false,
                  initialText: _auth!.email.toString(),
                  lable: "Email",
                  keyy: _emailKey,
                  validator: "Email",
                ),

                SizedBox(height: 50),
                Text("Change Password",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 15.0,
                    ))),
                SizedBox(height: 15),

                TextFieldWidget(
                  enable: true,
                  lable: "Current Password",
                  keyy: _currentPasswordKey,
                  validator: "Password",
                  controller: curruentPsswordController,
                ),

                SizedBox(height: 15),
                TextFieldWidget(
                    enable: true,
                    lable: "New Password",
                    keyy: _newPasswordKey,
                    validator: "Password",
                    controller: newPasswordController),

                SizedBox(height: 15),
                TextFieldWidget(
                    enable: true,
                    lable: "New Password, again",
                    keyy: _againNewPasswordKey,
                    validator: "Password",
                    controller: againNewPasswordController),

                SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(HexColor("#192A51")),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))),
                  onPressed: () {
                   if(newPasswordController.text == againNewPasswordController.text){
                     AuthO().userChangePassword(curruentPsswordController.text, newPasswordController.text);
                     Navigator.of(context).pop();
                   }else{
                     showSimpleNotification(
                        const Text("Password not match"),
                         background: Colors.red);
                   }
                    // if (_userNameSignUpDialogKey.currentState != null &&
                    //     _emailSignUpDialogKey.currentState != null &&
                    //     _passwordSignUpDialogKey.currentState != null) {
                    //   if (_userNameSignUpDialogKey.currentState!.validate() &&
                    //       _emailSignUpDialogKey.currentState!.validate() &&
                    //       _passwordSignUpDialogKey.currentState!.validate()) {
                    //     Navigator.of(context).pop();
                    //     AuthO().createUserWithEmailAndPassword(
                    //         email: emailController.text,
                    //         password: PasswordController.text);
                    //   }
                    // }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Save Changes",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 15.0,
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
                        fontSize: 15.0,
                      )),
                    )),
              ],
            ),
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
    TextEditingController? controller,
    String? initialText,
    required bool enable}) {
  return TextFormField(
    initialValue: initialText,
    enabled: enable,
    obscureText: validator == "Password" ? true : false,
    controller: controller,
    style: TextStyle(color: Colors.red),

    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(20),
      label: Text(lable, style: TextStyle(fontSize: 15)),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(20)),
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
  );
}
