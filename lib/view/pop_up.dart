import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

showPopUp(String title, String description, BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding:
            EdgeInsets.only(top: 10, bottom: 10, right: 7, left: 7),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: const EdgeInsets.only(right: 10),
                  ),
                  Text(
                    "$title",
                    style: GoogleFonts.poppins(
                        color: HexColor("#192A51"),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
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
                  "$description",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: HexColor("192A51"),
                    fontWeight: FontWeight.w400,
                  ),
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
                    backgroundColor: HexColor("#AAA1C8"),
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