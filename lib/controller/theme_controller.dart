// import 'package:chem_x/controller/theme_provider.dart';
// import 'package:chem_x/view/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class ThemeController extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<ProviderData>(
//       create: (context) => ProviderData(),
//       child: ChemxWitnTheme(),
//     );
//   }
// }
//
// class ChemxWitnTheme extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Provider.of<ProviderData>(context);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//       theme: theme.getTheme(),
//     );
//   }
// }
//
//
//
// // ChangeNotifierProvider<TextProvider>(
// // create: (_) => TextProvider(),
// // child: Sizer(builder: (context, orientation, deviceType) {
// // return  OverlaySupport.global(
// // child: MaterialApp(
// // debugShowCheckedModeBanner: false,
// // home: SplashScreen(),
// // // home: AuthO().haundleAuthState(),
// // ));
// // }))