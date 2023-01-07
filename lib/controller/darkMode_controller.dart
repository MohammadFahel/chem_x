import 'package:chem_x/controller/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../Controller/chem_provider.dart';
import '../view/splash_screen.dart';

class RunAppWithDarkMode extends StatelessWidget {
  const RunAppWithDarkMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TextProvider>(
        create: (context) => TextProvider(),
        child: Sizer(builder: (context, orientation, deviceType) {
          return OverlaySupport.global(
            child: MaterialApp(
                theme: ThemeService().lightTheme,
                darkTheme: ThemeService().darkTheme,
                themeMode: ThemeService().getThemeMode(),
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
