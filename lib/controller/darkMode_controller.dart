import 'package:chem_x/controller/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Controller/chem_provider.dart';
import '../main.dart';
import '../view/splash_screen.dart';

class RunAppWithDarkMode extends StatelessWidget {
  const RunAppWithDarkMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TextProvider>(
        create: (context) => TextProvider(),
        child: Sizer(builder: (context, orientation, deviceType) {
          return  const OverlaySupport.global(
              child: RunSplashScreen());
        }));
  }
}

ThemeData _themeData = darkMode? ThemeData.dark(): ThemeData.light();
class RunSplashScreen extends StatelessWidget {
  const RunSplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<TextProvider>(context);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      // home: AuthO().haundleAuthState(),
    );
  }
}
