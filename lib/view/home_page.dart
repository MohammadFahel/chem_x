import 'package:chem_x/View/periodic_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import 'drawer_page/my_drawer.dart';

const String alkali_metals = "#85CAC4";
const String metalloids = "#8C692B";
const String actinides = "#8C4D2D";
const String alkaline_earth_metals = "#622E39";
const String reactive_nonmetals = "#2A4165";
const String unknown_properties = "#46474C";
const String transition_metals = "#433C65";
const String noble_gases = "#934356";
const String post_transition_metals = "#2F4D47";
const String lanthanides = "#004A77";

var drawerIcon = GlobalKey<ScaffoldState>();


class PeriodicTablePage extends StatelessWidget {
  const PeriodicTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: Colors.white,
            ),
            home: const PeriodicTableHomePage(),
        );
      },
    );
  }
}

class PeriodicTableHomePage extends StatefulWidget {
  const PeriodicTableHomePage({Key? key}) : super(key: key);

  @override
  _PeriodicTableHomePageState createState() => _PeriodicTableHomePageState();
}

class _PeriodicTableHomePageState extends State<PeriodicTableHomePage> {
  //final PageController _periodicTable = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerIcon,
      drawer: const MyNavigationDrawer(),
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
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 0, bottom: 0, right: 7),
            child: IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage("assets/images/flask.png"),
                  size: 50,
                  color: Colors.black,
                )),
          ),
        ],
        leading: IconButton(
          icon: Image.asset('assets/images/myProfile.png', width: 30),
          onPressed: (){
            drawerIcon.currentState?.openDrawer();
          },
        ),
      ),

      // body: Padding(
      //   padding: EdgeInsets.all(10),
      //   child: PageView(
      //     controller: _periodicTable,
      //     children: [
      //       PeriodicTable()
      //     ],
      //     //physics: const NeverScrollableScrollPhysics()
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: PeriodicTable(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: HexColor("#00000").withOpacity(0.3),
                blurRadius: 10,
              )
            ]),
        child: BottomAppBar(
            elevation: 8,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Row(
                      children: [
                        CategoryContainer(alkali_metals),
                        SizedBox(
                          width: 3.w,
                        ),
                        CategoryText("Alkali Metals"),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Row(
                      children: [
                        CategoryContainer(metalloids),
                        SizedBox(
                          width: 3.w,
                        ),
                        CategoryText("Metalloids"),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Row(
                      children: [
                        CategoryContainer(actinides),
                        SizedBox(
                          width: 3.w,
                        ),
                        CategoryText("Actinides"),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Row(
                      children: [
                        CategoryContainer(alkaline_earth_metals),
                        SizedBox(
                          width: 3.w,
                        ),
                        CategoryText("Alkaline Earth Metals"),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Row(
                      children: [
                        CategoryContainer(reactive_nonmetals),
                        SizedBox(
                          width: 3.w,
                        ),
                        CategoryText("Reactive Nonmetals"),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Row(
                      children: [
                        CategoryContainer(unknown_properties),
                        SizedBox(
                          width: 3.w,
                        ),
                        CategoryText("Unknown Properties"),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Row(
                      children: [
                        CategoryContainer(transition_metals),
                        SizedBox(
                          width: 3.w,
                        ),
                        CategoryText("Transition Metals"),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Row(
                      children: [
                        CategoryContainer(noble_gases),
                        SizedBox(
                          width: 3.w,
                        ),
                        CategoryText("Noble Gases"),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Row(
                      children: [
                        CategoryContainer(post_transition_metals),
                        SizedBox(
                          width: 3.w,
                        ),
                        CategoryText("Post-transition Metals"),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Row(
                      children: [
                        CategoryContainer(lanthanides),
                        SizedBox(
                          width: 3.w,
                        ),
                        CategoryText("Lanthanides"),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

CategoryContainer(String color) {
  return Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      color: HexColor("$color"),
      shape: BoxShape.circle,
    ),
  );
}

CategoryText(String category) {
  return Text(
    "$category",
    style: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: HexColor("#192A51")),
    ),
  );
}
