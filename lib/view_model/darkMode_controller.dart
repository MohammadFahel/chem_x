import 'package:chem_x/view_model/chem_provider.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../view/splash_screen_pages/splash_screen.dart';

class RunAppWithDarkMode extends StatelessWidget {
  const RunAppWithDarkMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TextProvider>(
        create: (context) => TextProvider(),
        child: Sizer(builder: (context, orientation, deviceType) {
          return OverlaySupport.global(
            child: MaterialApp(
            //    theme: ThemeData.dark(),
              darkTheme: ThemeData.dark(),
              //  themeMode: ThemeService().getThemeMode(),
                debugShowCheckedModeBanner: false,
                home: const RunSplashScreen()),
          );
        }));
  }
}

class RunSplashScreen extends StatelessWidget {
  const RunSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
