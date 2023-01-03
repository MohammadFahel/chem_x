import 'package:chem_x/View/periodic_table.dart';
import 'package:chem_x/view/pop_up.dart';
import 'package:chem_x/view/quizzes_pages/quiz_category_page.dart';
import 'package:chem_x/view/quizzes_pages/quiz_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../Controller/chem_provider.dart';
import '../controller/theme_service.dart';
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


class PeriodicTablePage extends StatefulWidget {
  const PeriodicTablePage({Key? key}) : super(key: key);

  @override
  State<PeriodicTablePage> createState() => _PeriodicTablePageState();
}

class _PeriodicTablePageState extends State<PeriodicTablePage> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeService().lightTheme,
          darkTheme: ThemeService().darkTheme,
          themeMode: ThemeService().getThemeMode(),
            // theme: ThemeData.light().copyWith(
            //   scaffoldBackgroundColor: ThemeService().getThemeMode() == ThemeMode.light? Colors.white: Colors.black12,
            // ),
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
  DatabaseReference ref = FirebaseDatabase.instance.ref(FirebaseAuth.instance.currentUser!.uid);
  @override
  Widget build(BuildContext context) {
    ref.onValue.listen((event) {
      Provider.of<TextProvider>(context, listen: false).userData = event.snapshot.value as Map ;
    }
    );
    return Scaffold(
      key: drawerIcon,

      drawer: const MyNavigationDrawer(),
      endDrawer: const QuizDrawerPage(),
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: SizedBox(
            height: 1,
          ),
        ),
        backgroundColor: ThemeService().getThemeMode() == ThemeMode.light? Colors.white: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        shadowColor: Colors.black,
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 0, bottom: 0, right: 7),
            child: IconButton(
                onPressed: () {
                  drawerIcon.currentState?.openEndDrawer();
                },
                icon: Image.asset('assets/images/flask.png', color: Colors.black)
                // icon: const ImageIcon(
                //   AssetImage("assets/images/flask.png"),
                //   size: 50,
                //   color: Colors.black,
                // )
            ),
          ),
        ],
        leading: IconButton(

          icon: Icon(Icons.person_outline,
              color: Colors.black,
              size: 30),
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
            color: ThemeService().getThemeMode() == ThemeMode.light? Colors.white: Colors.grey,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap: ()=>showPopUp("Alkali Metals", "Alkali metals are a group of chemical elements in the periodic table that are characterized by their metallic properties and their ability to form cations with a +1 charge. Alkali metals have a number of unique properties, including low densities, high melting and boiling points, and the ability to ignite in air. They are also known for their high reactivity, which is due to their tendency to lose electrons and form positive ions or cations. Alkali metals are used in a variety of applications, including the production of batteries, explosives, and pharmaceuticals.", context),
                      child: Row(
                        children: [
                          CategoryContainer(alkali_metals),
                          SizedBox(
                            width: 3.w,
                          ),
                          CategoryText("Alkali Metals"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    InkWell(
                      onTap: ()=>showPopUp("Metalloids", "Metalloids are a group of chemical elements that have properties intermediate between those of metals and nonmetals. Metalloids have a number of unique properties, including intermediate melting and boiling points, the ability to form both ionic and covalent bonds, and the ability to conduct electricity to some degree. They are used in a variety of applications, including the production of semiconductors, alloys, and pharmaceuticals.", context),
                      child: Row(
                        children: [
                          CategoryContainer(metalloids),
                          SizedBox(
                            width: 3.w,
                          ),
                          CategoryText("Metalloids"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    InkWell(
                      onTap: ()=>showPopUp("Actinides", "The actinides are a series of chemical elements in the periodic table that are characterized by their similar chemical properties and electron configurations. Actinides are also known as the \"transuranic elements,\" as they are located in the periodic table beyond uranium, which is the heaviest naturally occurring element. These elements have a number of unique properties, including high melting and boiling points, the ability to form complex ions, and strong metallic bonds. They are used in a variety of applications, including nuclear energy, medicine, and research.", context),
                      child: Row(
                        children: [
                          CategoryContainer(actinides),
                          SizedBox(
                            width: 3.w,
                          ),
                          CategoryText("Actinides"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    InkWell(
                      onTap: ()=>showPopUp("Alkaline Earth Metals", "Alkaline earth metals are a group of chemical elements in the periodic table that are characterized by their metallic properties and their ability to form cations with a +2 charge. Alkaline earth metals have a number of unique properties, including high melting and boiling points, the ability to form complex ions, and the ability to act as catalysts in chemical reactions. They are also known for their strong metallic bonds and their ability to form alloys with other metals. Alkaline earth metals are used in a variety of applications, including the production of alloys, catalysts, and pharmaceuticals.", context),
                      child: Row(
                        children: [
                          CategoryContainer(alkaline_earth_metals),
                          SizedBox(
                            width: 3.w,
                          ),
                          CategoryText("Alkaline Earth Metals"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    InkWell(
                      onTap: ()=>showPopUp("Reactive Nonmetals", "Reactive nonmetals are a group of chemical elements that are characterized by their high reactivity and their ability to form covalent bonds with other nonmetals. Reactive nonmetals have a number of unique properties, including low melting and boiling points, low densities, and high electronegativities. They are known for their high reactivity, which is due to their tendency to gain electrons and form negative ions or anions. Reactive nonmetals are used in a variety of applications, including the production of fertilizers, explosives, and plastics.", context),
                      child: Row(
                        children: [
                          CategoryContainer(reactive_nonmetals),
                          SizedBox(
                            width: 3.w,
                          ),
                          CategoryText("Reactive Nonmetals"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    InkWell(
                      onTap: ()=>showPopUp("Unknown Properties", "There are many unknown properties in chemistry that are currently being studied by researchers, including the properties of new materials and compounds, the behavior of chemical reactions under extreme conditions, and the mechanisms by which certain chemical reactions occur. These unknown properties are being explored in order to better understand the fundamental nature of matter and the world around us.", context),
                      child: Row(
                        children: [
                          CategoryContainer(unknown_properties),
                          SizedBox(
                            width: 3.w,
                          ),
                          CategoryText("Unknown Properties"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    InkWell(
                      onTap: ()=>showPopUp("Transition Metals", "Transition metals are a group of chemical elements in the periodic table that are characterized by their ability to form multiple stable ions with different charges, and by the partially filled d orbitals in their valence electron shells.", context),
                      child: Row(
                        children: [
                          CategoryContainer(transition_metals),
                          SizedBox(
                            width: 3.w,
                          ),
                          CategoryText("Transition Metals"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    InkWell(
                      onTap: ()=>showPopUp("Noble Gases", "Noble gases are a group of chemical elements that are characterized by their low reactivity and their ability to exist as monatomic gases at standard temperature and pressure. They are known for their stability and low reactivity, which is due to their full valence electron shells. Noble gases are used in a variety of applications, including lighting, refrigeration, and welding. They are also used in the production of semiconductors and in the medical field for MRI imaging.", context),
                      child: Row(
                        children: [
                          CategoryContainer(noble_gases),
                          SizedBox(
                            width: 3.w,
                          ),
                          CategoryText("Noble Gases"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    InkWell(
                      onTap: ()=>showPopUp("Post-transition Metals", "Post-transition Metals are characterized by their metallic properties and their ability to form cations with different charges. They also have a variety of unique chemical and physical properties, including high melting and boiling points, the ability to form complex ions, and the ability to act as catalysts in chemical reactions. Post-transition metals are used in a variety of applications, including electrical conductivity, corrosion resistance, and the production of alloys.", context),
                      child: Row(
                        children: [
                          CategoryContainer(post_transition_metals),
                          SizedBox(
                            width: 3.w,
                          ),
                          CategoryText("Post-transition Metals"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    InkWell(
                      onTap: ()=>showPopUp("Lanthanides", "The lanthanides are a series of chemical elements in the periodic table that are characterized by their similar chemical properties and electron configurations. Lanthanides are also known as the \"rare earth elements,\" as they are not found in pure form in nature and must be extracted from ores through a complex and expensive process. These elements have a variety of unique properties, including high melting and boiling points, the ability to form complex ions, and strong metallic bonds. They are used in a variety of applications, including magnets, catalysts, and electronic devices.", context),
                      child: Row(
                        children: [
                          CategoryContainer(lanthanides),
                          SizedBox(
                            width: 3.w,
                          ),
                          CategoryText("Lanthanides"),
                        ],
                      ),
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
      border: Border.all(color: HexColor("${color}"), width: 1.5),
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomRight,
        colors: [
          HexColor("${color}").withOpacity(0.9),
          HexColor("${color}").withOpacity(0.6)
        ],
      ),
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
