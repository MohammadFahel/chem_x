import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';
import 'package:chem_x/Controller/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../Controller/chem_provider.dart';
import '../../../controller/theme_service.dart';
import '../my_drawer.dart';

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
  var userNameController = TextEditingController();
  var curruentPsswordController = TextEditingController();
  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var againNewPasswordController = TextEditingController();

  final FirebaseAuth _autho = FirebaseAuth.instance;


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
        backgroundColor: ThemeService().getThemeMode() == ThemeMode.light? Colors.white: Colors.grey.shade500,
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                ChangeUserPhoto(),
                // SizedBox(height: 15),
                // Text("User Information",
                //     style: GoogleFonts.poppins(
                //         textStyle: TextStyle(
                //       fontSize: 15.0,
                //     ))),
                SizedBox(height: 25),
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

                // SizedBox(height: 25),
                // Text("Change Password",
                //     style: GoogleFonts.poppins(
                //         textStyle: TextStyle(
                //       fontSize: 15.0,
                //     ))),
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

                SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeService().getThemeMode() == ThemeMode.light? HexColor("#192A51"): HexColor("#849ED9"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0))),
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
                        color: ThemeService().getThemeMode() == ThemeMode.light? HexColor("#B90000"): Colors.redAccent,
                        fontSize: 15.0,
                      )),
                    )),
              ],
            ),
          ),
        ),

    );
  }

  Widget ChangeUserPhoto(){
    if (_autho.currentUser!.providerData[0].providerId.contains("facebook")) {
      return Container(
          child:  Consumer<TextProvider>(
              builder: (context, data, child) {
                // return Text(data.data['someKey'].toString());
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 70,
                      child: Image.asset("assets/images/editProfile.png", width: 100, height: 100),
                    ),
                    Text(
                      data.data['name'].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      data.data['email'].toString(),
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 14,
                      ),
                    ),
                  ],
                );
              }
          ));
    } else if (_autho.currentUser!.providerData[0].providerId
        .contains("google")) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 70,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 70,
                child: Image.asset("assets/images/editProfile.png", width: 100, height: 100),
              ),
            ),
            Text(
              _autho.currentUser!.displayName.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              _autho.currentUser!.email.toString(),
              style: TextStyle(
                color: Colors.grey[200],
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    } else {
      DatabaseReference ref =
      FirebaseDatabase.instance.ref().child(_autho.currentUser!.uid);
      return Container(
          // color: HexColor('#AAA1C8'),
          // width: double.infinity,
          // height: 200,
          // padding: EdgeInsets.only(top: 20.0),
          child:  Consumer<TextProvider>(
              builder: (context, data, child) {

                // return Text(data.data['someKey'].toString());
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage:NetworkImage(data.userData['photo'].toString()),
                      backgroundColor: Colors.transparent,),
                    SizedBox(height: 10),
                    InkWell(
                      child: Text("Change Photo", style: TextStyle(
                        color: ThemeService().getThemeMode() == ThemeMode.light? Colors.blueAccent: HexColor("#849ED9"),
                        decoration: TextDecoration.underline,
                      )),
                      onTap: () async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? file = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        if (file == null) return;
                        Reference referenceRoot =
                        FirebaseStorage.instance.ref().child("userImage");
                        Reference referenceUploadImage =
                        referenceRoot.child(_autho.currentUser!.uid);
                        try {
                          await referenceUploadImage
                              .putFile(File(file!.path));
                          profilePicture =
                          await referenceUploadImage.getDownloadURL();
                          await ref.update({
                            "photo": profilePicture,
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ],
                );
              }

          ));
    }
  }
}



Widget TextFieldWidget(
    {required String lable,
     GlobalKey<FormFieldState>? keyy,
    required String validator,
    TextEditingController? controller,
    String? initialText,
    required bool enable}) {
  return TextFormField(
    initialValue: initialText,
    enabled: enable,
    obscureText: validator == "Password" ? true : false,
    controller: controller,
    style: validator == "UserName" || validator == "Email"?
    TextStyle(color: ThemeService().getThemeMode() == ThemeMode.light? Colors.black54: Colors.grey):
    TextStyle(color: ThemeService().getThemeMode() == ThemeMode.light? Colors.black: Colors.white) ,

    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(20),
      label: Text(lable, style: TextStyle(fontSize: 15)),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeService().getThemeMode() == ThemeMode.light? Colors.black: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(20)),
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
  );
}
