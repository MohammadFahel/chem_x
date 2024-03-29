import 'package:chem_x/view/periodic_table_pages/pop_up.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

import '../../view_model/theme_service.dart';


class ElementPage extends StatefulWidget {
  final String summary,
      appearance,
      category,
      discoveredBy,
      namedBy,
      myColor,
      symbol,
      name,
      phase;
  final double atomicMass, boil, density, melt, molarHeat;
  final int number, period;

  const ElementPage(
      {Key? key,
      required this.summary,
      required this.atomicMass,
      required this.appearance,
      required this.boil,
      required this.category,
      required this.density,
      required this.discoveredBy,
      required this.melt,
      required this.molarHeat,
      required this.namedBy,
      required this.number,
      required this.period,
      required this.phase,
      required this.myColor,
      required this.symbol,
      required this.name})
      : super(key: key);

  @override
  State<ElementPage> createState() => _ElementPageState();
}

class _ElementPageState extends State<ElementPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  double rotationAngle = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 100));
    animationController.repeat(reverse: false);

    animationController.addListener(() {
      setState(() {
        rotationAngle = animationController.value *50 ;
      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    showButton(BuildContext context, String title, String description) {
      return Transform.rotate(
        angle: 180 * math.pi / 180,
        child: IconButton(
            onPressed: () => showPopUp(title, description, context),
            iconSize: 20,
            icon: const Icon(Icons.arrow_back_ios)),
      );
    }

    buildColumn(String title, dynamic content, bool desc, String description) {
      return Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            desc
                ? showButton(context, title, description)
                : SizedBox(width: 5.w)
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "$content",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
            ? Colors.white
            : Colors.grey.shade500,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      width:150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: HexColor(widget.myColor), width: 1.5),
                        color: HexColor(widget.myColor),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                          colors: [
                            HexColor(widget.myColor).withOpacity(0.9),
                            HexColor(widget.myColor).withOpacity(0.4)
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${widget.number}",
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                          Text(widget.symbol,
                              style: GoogleFonts.poppins(
                                  fontSize: 45,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text(widget.name,
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(width: 9.w,),
                  Expanded(
                    child: Container(



                             child: Transform.rotate(
                                      angle: rotationAngle,
                                      child: Image.asset(
                                        "assets/images/${widget.name}.png",

                                      ),
                                    ),



    )
                  ),
                ],
              ),
            ),

            // Container(
            //   color: Colors.white,
            //   child: const Text(
            //     "M",
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
            Expanded(
              child: SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      buildColumn(
                          "Summary", widget.summary, true, widget.summary),
                      buildColumn(
                          "Category", widget.category, false, widget.category),
                      widget.appearance.isNotEmpty
                          ? buildColumn("Appearance", widget.appearance, false,
                              widget.appearance)
                          : SizedBox(
                              height: 0.0.h,
                            ),
                      buildColumn(
                          "Atomic Mass",
                          "${widget.atomicMass.toStringAsFixed(3)} Da (Dalton)",
                          true,
                          "Atomic mass, the quantity of matter contained in an atom of an element. It is expressed as a multiple of one-twelfth the mass of the carbon-12 atom, 1.992646547 × 10−23 gram, which is assigned an atomic mass of 12 units."),
                      buildColumn("Boiling Point", "${widget.boil} K", true,
                          "Boiling is the process by which a liquid turns into a vapor when it is heated to its boiling point. The change from a liquid phase to a gaseous phase occurs when the vapor pressure of the liquid is equal to the atmospheric pressure exerted on the liquid."),
                      buildColumn(
                          "Density",
                          "${widget.density} Kg/m\u00B3",
                          true,
                          "Density is the measurement of how tightly a material is packed together. It is defined as the mass per unit volume. Density Symbol: D or ρ Density Formula: ρ = m/V, where ρ is the density, m is the mass of the object and V is the volume of the object."),
                      buildColumn("Melting Point", "${widget.melt} K", true,
                          "Melting, change of a solid into a liquid when heat is applied. In a pure crystalline solid, this process occurs at a fixed temperature called the melting point; an impure solid generally melts over a range of temperatures below the melting point of the principal component."),
                      buildColumn(
                          "Molar Heat",
                          "${widget.molarHeat} J/mol °C",
                          true,
                          "Molar heat capacity is defined as the amount of heat required to raise 1 mole of a substance by 1 degree Kelvin."),
                      buildColumn("Period", widget.period, false, ""),
                      buildColumn("Phase", widget.phase, true,
                          "There are four phases in chemistry: solid, liquid, gas, and plasma."),
                      widget.namedBy.isNotEmpty
                          ? buildColumn("Named By", widget.namedBy, false, "")
                          : SizedBox(
                              height: 0.0.h,
                            ),
                      widget.discoveredBy.isNotEmpty
                          ? buildColumn(
                              "Discovered By", widget.discoveredBy, false, "")
                          : SizedBox(
                              height: 0.0.h,
                            ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
