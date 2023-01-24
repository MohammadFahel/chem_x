// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, avoid_print

import 'dart:io';
import 'package:chem_x/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:chem_x/view_model/firebase_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:string_validator/string_validator.dart';
import '../../../view_model/chem_provider.dart';
import '../../../view_model/theme_service.dart';
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
  var currentPasswordController = TextEditingController();
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
        backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
            ? Colors.white
            : Colors.grey.shade500,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        shadowColor: Colors.black,
        title: Text(languages.profileEditTitle(),
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              ChangeUserPhoto(),
              const SizedBox(height: 25),
              FutureBuilder(
                  future: FirebaseController().getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data as Map;
                      return TextFieldWidget(
                        enable: false,
                        initialText: data["userName"],
                        lable: languages.dialogSignupUserHint(),
                        keyy: _usernameKey,
                        validator: "UserName",
                      );
                    } else {
                      return const Text("No data");
                    }
                  }),
              const SizedBox(height: 15),
              TextFieldWidget(
                enable: false,
                initialText: _auth!.email.toString(),
                lable: languages.dialogSigninEmailHint(),
                keyy: _emailKey,
                validator: "Email",
              ),
              const SizedBox(height: 15),
              TextFieldWidget(
                enable: true,
                lable: languages.profileCurrentPassword(),
                keyy: _currentPasswordKey,
                validator: "CurrentPassword",
                controller: currentPasswordController,
              ),
              const SizedBox(height: 15),
              TextFieldWidget(
                  enable: true,
                  lable: languages.profileNewPassword(),
                  keyy: _newPasswordKey,
                  validator: "Password",
                  controller: newPasswordController),
              const SizedBox(height: 15),
              TextFieldWidget(
                  enable: true,
                  lable: languages.profileReNewPassword(),
                  keyy: _againNewPasswordKey,
                  validator: "Password",
                  controller: againNewPasswordController),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        ThemeService().getThemeMode() == ThemeMode.light
                            ? HexColor("#192A51")
                            : HexColor("#849ED9"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                onPressed: () {
                  if (_currentPasswordKey.currentState != null &&
                      _newPasswordKey.currentState != null &&
                      _againNewPasswordKey.currentState != null) {
                    if (_currentPasswordKey.currentState!.validate() &&
                        _newPasswordKey.currentState!.validate() &&
                        _againNewPasswordKey.currentState!
                            .validate()) if (newPasswordController.text ==
                        againNewPasswordController.text) {
                      FirebaseController().userChangePassword(
                          currentPasswordController.text,
                          newPasswordController.text);
                      Navigator.of(context).pop();
                    }
                  } else {
                    showSimpleNotification(const Text("You'r data has an issue"),
                        background: Colors.red);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    languages.profileSaveChanges(),
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
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
                    languages.profileCancelChanges(),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: ThemeService().getThemeMode() == ThemeMode.light
                          ? HexColor("#B90000")
                          : Colors.redAccent,
                      fontSize: 15.0,
                    )),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget ChangeUserPhoto() {
    if (_autho.currentUser!.providerData[0].providerId.contains("facebook")) {
      return Consumer<TextProvider>(builder: (context, data, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 70,
              child: Image.asset("assets/images/editProfile.png",
                  width: 100, height: 100),
            ),
            Text(
              data.data['name'].toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
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
      });
    } else if (_autho.currentUser!.providerData[0].providerId
        .contains("google")) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 70,
              child: Image.asset("assets/images/editProfile.png",
                  width: 100, height: 100),
            ),
          ),
          Text(
            _autho.currentUser!.displayName.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            _autho.currentUser!.email.toString(),
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      );
    } else {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref().child(_autho.currentUser!.uid);
      return Consumer<TextProvider>(builder: (context, data, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(data.userData['photo'].toString()),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 10),
            InkWell(
              child: Text(languages.profileChangePhoto(),
                  style: TextStyle(
                    color: ThemeService().getThemeMode() == ThemeMode.light
                        ? Colors.blueAccent
                        : HexColor("#849ED9"),
                    decoration: TextDecoration.underline,
                  )),
              onTap: () async {
                ImagePicker imagePicker = ImagePicker();
                XFile? file =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                if (file == null) return;
                Reference referenceRoot =
                    FirebaseStorage.instance.ref().child("userImage");
                Reference referenceUploadImage =
                    referenceRoot.child(_autho.currentUser!.uid);
                try {
                  await referenceUploadImage.putFile(File(file.path));
                  profilePicture = await referenceUploadImage.getDownloadURL();
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
      });
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
  return Directionality(
    textDirection: languages.getMyLanguages() == 'EN'
        ? TextDirection.ltr
        : TextDirection.rtl,
    child: TextFormField(
      initialValue: initialText,
      enabled: enable,
      obscureText: validator == "Password" ? true : false,
      controller: controller,
      style: validator == "UserName" || validator == "Email"
          ? TextStyle(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black54
                  : Colors.grey)
          : TextStyle(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        label: Text(lable, style: const TextStyle(fontSize: 15)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(20)),
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
    ),
  );
}
