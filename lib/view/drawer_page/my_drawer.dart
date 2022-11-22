import 'package:chem_x/view/drawer_page/pages/change_language.dart';
import 'package:chem_x/view/drawer_page/pages/change_theme.dart';
import 'package:chem_x/view/drawer_page/pages/my_profile.dart';
import 'package:chem_x/view/drawer_page/pages/send_feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Controller/auth.dart';

class MyNavigationDrawer extends StatelessWidget {
  const MyNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onPressed: ()=> onItemPressed(context, index: 0),
              ),
              const SizedBox(height: 15),
              DrawerItem(
                  name: 'Change Language',
                  icon: Icons.language,
                  onPressed: ()=> onItemPressed(context, index: 1)
              ),
              const SizedBox(height: 15),
              DrawerItem(
                  name: 'Change Theme',
                  icon: Icons.dark_mode,
                  onPressed: ()=> onItemPressed(context, index: 2)
              ),
              const SizedBox(height: 15),
              DrawerItem(
                  name: 'Send Feedback',
                  icon: Icons.favorite_outline,
                  onPressed: ()=> onItemPressed(context, index: 3)
              ),
              const SizedBox(height: 15),
              const Divider(thickness: 1, height: 10, color: Colors.grey),
              const SizedBox(height: 15),
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: ()=> onItemPressed(context, index: 4)
              ),

            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);

    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfile()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangeLanguage()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangeTheme()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SendFeedback()));
        break;
      case 4:
        AuthO().signOutUser();
        break;
    }
  }


  Widget headerWidget() {
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/myProfile.png'),
              ),
            ),
          ),
          Text(
            "ChemX User",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "chemx@asu.edu.jo",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );

  }

}


class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required this.name, required this.icon, required this.onPressed}) : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              Icon(icon, size: 20, color: Colors.black,),
              const SizedBox(width: 30),
              Text(name, textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15, color: HexColor("#0E131F"))))
            ],
          ),
        ),
      ),
    );
  }
}