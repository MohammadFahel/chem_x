import 'package:chem_x/main.dart';
import 'package:chem_x/view/drawer_page/pages/change_language.dart';
import 'package:chem_x/view/drawer_page/pages/my_profile.dart';
import 'package:chem_x/view/drawer_page/pages/send_feedback.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:chem_x/view_model/firebase_controller.dart';
import '../../View/periodic_table_pages/home_page.dart';
import '../../view_model/chem_provider.dart';
import '../../View/admin_pages/admin_select_category.dart';
import '../../view_model/theme_service.dart';

const List<String> languageList = <String>['EN', 'AR'];
String profilePicture = "";

class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({Key? key}) : super(key: key);

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    setState(() {
      languages.getMyLanguages();
    });
  }

  @override
  Widget build(BuildContext context) {
    var providerChem = Provider.of<TextProvider>(context, listen: true);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            headerWidget(),
             SizedBox(height: 2.h),
             Divider(thickness: 1, height: 1.h, color: Colors.grey),
             SizedBox(height: 2.h),
            Row(
              textDirection: languages.getMyLanguages() == 'EN'
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              children: [
                DrawerItem(
                    name: languages.drawerChangeTheme(),
                    icon: Icons.dark_mode,
                    onPressed: () => onItemPressed(context, index: 2)),
                SizedBox(width: languages.getMyLanguages() == 'EN' ? 8.w : 18.w),
                Switch(
                  activeColor: HexColor('#AAA1C8'),
                  value: providerChem.isActive,
                  onChanged: (newValue) {
                    providerChem.isActiveSwitch(newValue);
                    ThemeService().changeTheme();
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PeriodicTablePage()));
                    });
                  },
                )
              ],
            ),
             SizedBox(height: 2.h),
            DrawerItem(
                name: languages.drawerFeedback(),
                icon: Icons.favorite_outline,
                onPressed: () => onItemPressed(context, index: 3)),
             SizedBox(height: 2.h),
            Row(
              textDirection: languages.getMyLanguages() == 'EN'
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              children: [
                DrawerItem(
                    name: languages.drawerChangeLanguage(),
                    icon: Icons.language,
                    onPressed: () => onItemPressed(context, index: 2)),
                SizedBox(width: languages.getMyLanguages() == 'EN' ? 4.w : 22.w),
                DropdownButton(
                  value: dropdownValue,
                  items: languageList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setString('myLanguages', newValue.toString());
                    languages.setMyLanguages(newValue.toString());
                    myLanguages = newValue.toString();
                    setState(() {
                      dropdownValue = newValue.toString();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PeriodicTablePage()));
                    });
                  },
                )
              ],
            ),
             SizedBox(height: 2.h),
            DrawerItem(name: "CRUD Operation", icon: Icons.admin_panel_settings, onPressed:() => onItemPressed(context, index: 2)),
             SizedBox(height: 2.h),
             Divider(thickness: 1, height: 2.h, color: Colors.grey),
             SizedBox(height: 2.h),
            DrawerItem(
                name: languages.drawerLogout(),
                icon: Icons.logout,
                onPressed: () => onItemPressed(context, index: 4)),
          ],
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyProfile()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChangeLanguage()));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CRUDOperations()));
        break;
      case 3:
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SendFeedback();
            });
        break;
      case 4:
        setState(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PeriodicTablePage()));
          FirebaseController().signOutUser();
        });

        break;
    }
  }

  Widget headerWidget() {
    if (_auth.currentUser!.providerData[0].providerId.contains("facebook")) {
      return Container(
          height: 35.h,
          padding: const EdgeInsets.only(top: 20.0),
          child: Consumer<TextProvider>(builder: (context, data, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 15.h,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          NetworkImage(data.data['pic'].toString()),
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  data.data['name'].toString(),
                  style: TextStyle(
                      color: ThemeService().getThemeMode() == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 20),
                ),
                Text(
                  data.data['email'].toString(),
                  style: TextStyle(
                    color: ThemeService().getThemeMode() == ThemeMode.light
                        ? Colors.grey[600]
                        : Colors.grey[100],
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 2.h),
                InkWell(
                    child: Text(languages.drawerEditProfile(),
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w500))),
                    onTap: () {
                      onItemPressed(context, index: 0);
                    }),
              ],
            );
          }));
    } else if (_auth.currentUser!.providerData[0].providerId
        .contains("google")) {
      return Container(
        height: 35.h,
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 15.h,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage:
                      NetworkImage(_auth.currentUser!.photoURL.toString()),
                  backgroundColor: Colors.transparent,
                )),
            SizedBox(
              height: 1.h,
            ),
            Text(
              _auth.currentUser!.displayName.toString(),
              style: TextStyle(
                  color: ThemeService().getThemeMode() == ThemeMode.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 20),
            ),
            Text(
              _auth.currentUser!.email.toString(),
              style: TextStyle(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.grey[600]
                    : Colors.grey[100],
                fontSize: 14,
              ),
            ),
            SizedBox(height: 2.h),
            InkWell(
                child: Text(languages.drawerEditProfile(),
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500))),
                onTap: () {
                  onItemPressed(context, index: 0);
                }),
          ],
        ),
      );
    } else {
      return Container(
          height: 35.h,
          padding: const EdgeInsets.only(top: 20.0),
          child: Consumer<TextProvider>(builder: (context, data, child) {
            if(data.userData == {}){
              return CircularProgressIndicator();
            }else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 15.h,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                        NetworkImage(data.userData['photo'].toString()),
                        backgroundColor: Colors.transparent,
                      )),
                   SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    data.userData['userName'].toString(),
                    style: TextStyle(
                        color: ThemeService().getThemeMode() == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 20),
                  ),
                  Text(
                    data.userData['email'].toString(),
                    style: TextStyle(
                      color: ThemeService().getThemeMode() == ThemeMode.light
                          ? Colors.grey[600]
                          : Colors.grey[100],
                      fontSize: 14,
                    ),
                  ),
                   SizedBox(height: 2.h),
                  InkWell(
                      child: Text(languages.drawerEditProfile(),
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w500))),
                      onTap: () {
                        onItemPressed(context, index: 0);
                      }),
                ],
              );
            }

          }));
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
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 5.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: languages.getMyLanguages() == 'EN'
                ? TextDirection.ltr
                : TextDirection.rtl,
            children: [
              Icon(
                icon,
                size: 20,
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
              ),
              SizedBox(width: 4.w),
              Text(name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 15,
                    color: ThemeService().getThemeMode() == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
