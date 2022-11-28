// import 'package:chem_x/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:provider/provider.dart';
//
// class ProviderData extends ChangeNotifier {
//   ThemeMode _themeMode = (darkMode? ThemeData.dark(): ThemeData.light()) as ThemeMode;
//
//   getTheme(){
//     return _themeMode;
//   }
//
//   setTheme(ThemeData theme){
//     _themeMode = theme as ThemeMode;
//     notifyListeners();
//   }
//
// //
// //   bool get isDarkMode {
// //     if (themeMode == ThemeMode.system) {
// //       final brightness = SchedulerBinding.instance.window.platformBrightness;
// //       return brightness == Brightness.dark;
// //     } else {
// //       return themeMode == ThemeMode.dark;
// //     }
// //   }
// //
// //   void toggleTheme(bool isOn) {
// //     themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
// //     notifyListeners();
// //   }
//  }
//
// // class MyThemes {
// //   static final darkTheme = ThemeData(
// //     scaffoldBackgroundColor: Colors.grey.shade900,
// //     primaryColor: Colors.black,
// //     colorScheme: ColorScheme.dark(),
// //     iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
// //   );
// //
// //   static final lightTheme = ThemeData(
// //     scaffoldBackgroundColor: Colors.white,
// //     primaryColor: Colors.white,
// //     colorScheme: ColorScheme.light(),
// //     iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
// //   );
// // }
// //
// // class ChangeThemeButtonWidget extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final themeProvider = Provider.of<ThemeProvider>(context);
// //
// //     return Switch.adaptive(
// //       value: themeProvider.isDarkMode,
// //       onChanged: (value) {
// //         final provider = Provider.of<ThemeProvider>(context, listen: false);
// //         provider.toggleTheme(value);
// //       },
// //     );
// //   }
// // }