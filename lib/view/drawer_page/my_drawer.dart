import 'dart:io';

import 'package:chem_x/main.dart';
import 'package:chem_x/module/facebook_info.dart';
import 'package:chem_x/view/drawer_page/pages/change_language.dart';
import 'package:chem_x/view/drawer_page/pages/change_theme.dart';
import 'package:chem_x/view/drawer_page/pages/my_profile.dart';
import 'package:chem_x/view/drawer_page/pages/send_feedback.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../Controller/auth.dart';
import '../../Controller/chem_provider.dart';
import '../../module/routing_navigator.dart';

const List<String> languageList = <String>['EN', 'AR'];
String profilePicture = "";

class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({Key? key}) : super(key: key);

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  bool _darkMode = false;
  bool isSwitched = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = languageList.first;

    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 15),
              DrawerItem(
                  name: 'My Account',
                  icon: Icons.account_circle_outlined,
                  onPressed: () => onItemPressed(context, index: 0)),
              const SizedBox(height: 15),
              Row(
                children: [
                  DrawerItem(
                      name: 'Change Theme',
                      icon: Icons.dark_mode,
                      onPressed: () => onItemPressed(context, index: 2)),
                  const SizedBox(width: 50),
                  Switch(
                    activeColor: HexColor('#AAA1C8'),
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 15),
              DrawerItem(
                  name: 'Send Feedback',
                  icon: Icons.favorite_outline,
                  onPressed: () => onItemPressed(context, index: 3)),
              const SizedBox(height: 15),
              const Divider(thickness: 1, height: 10, color: Colors.grey),
              const SizedBox(height: 15),
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: () => onItemPressed(context, index: 4)),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    // Navigator.pop(context);

    switch (index) {
      case 0:
        // Navigator.pushNamed(context, myProfileRoute);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyProfile()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChangeLanguage()));
        break;
      case 2:
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const ChangeTheme()));
        break;
      case 3:
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SendFeedback();
            });
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => SendFeedback()));
        break;
      case 4:
        AuthO().signOutUser();
        break;
    }
  }

  Widget headerWidget() {
    if (_auth.currentUser!.providerData[0].providerId.contains("facebook")) {
      return Container(
          color: HexColor('#AAA1C8'),
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.only(top: 20.0),
          child:  Consumer<TextProvider>(
            builder: (context, data, child) {
              // return Text(data.data['someKey'].toString());
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 70,
                        child: Image.network(data.data['pic'].toString()),
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
    } else if (_auth.currentUser!.providerData[0].providerId
        .contains("google")) {
      return Container(
        color: HexColor('#AAA1C8'),
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 70,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 70,
                child: Image.network(_auth.currentUser!.photoURL.toString()),
              ),
            ),
            Text(
              _auth.currentUser!.displayName.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              _auth.currentUser!.email.toString(),
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
          FirebaseDatabase.instance.ref().child(_auth.currentUser!.uid);
      return Container(
          color: HexColor('#AAA1C8'),
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.only(top: 20.0),
          child:  Consumer<TextProvider>(
              builder: (context, data, child) {

                // return Text(data.data['someKey'].toString());
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 70,
                        child: Image.network(data.userData['photo'].toString()),
                      ),
                      InkWell(
                        child: Text("Add new Photo"),
                        onTap: () async {
                          ImagePicker imagePicker = ImagePicker();
                          XFile? file = await imagePicker.pickImage(
                              source: ImageSource.gallery);
                          if (file == null) return;
                          Reference referenceRoot =
                              FirebaseStorage.instance.ref().child("userImage");
                          Reference referenceUploadImage =
                              referenceRoot.child(_auth.currentUser!.uid);
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
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.userData['userName'].toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        data.userData['email'].toString(),
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
                }

                ));
    }
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: Colors.black,
              ),
              const SizedBox(width: 20),
              Text(name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 15, color: HexColor("#0E131F"))))
            ],
          ),
        ),
      ),
    );
  }
}
