import 'package:flutter/material.dart';

import '../view/drawer_page/pages/my_profile.dart';
import '../view/drawer_page/pages/send_feedback.dart';
import '../view/on_boarding_screen.dart';
import '../view/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/MyProfile':
        return MaterialPageRoute(builder: (_) => MyProfile());
      case '/SendFeedback':
        return MaterialPageRoute(builder: (_) => SendFeedback());
      default:
        return _errorRoute();
    }
  }

  Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}


