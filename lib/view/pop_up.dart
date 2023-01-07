import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/theme_service.dart';

showPopUp(String title, String description, BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 7, left: 7),
            width: double.infinity,
            decoration: BoxDecoration(
                color: ThemeService().getThemeMode() == ThemeMode.light
                    ? Colors.white
                    : Colors.grey.shade900,
                borderRadius: BorderRadius.circular(30)),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                  ),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 0.2,
                width: double.infinity,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Text(
                  description,
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: ThemeService().getThemeMode() == ThemeMode.light
                          ? Colors.grey.shade700
                          : Colors.grey.shade400),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 6.0,
                    backgroundColor:
                        ThemeService().getThemeMode() == ThemeMode.light
                            ? HexColor("#192A51")
                            : HexColor("#849ED9"),
                  ),
                  child: Text(
                    "Done",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                    )),
                  ))
            ]),
          ),
        );
      });
}
