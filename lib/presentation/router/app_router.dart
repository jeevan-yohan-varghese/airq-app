import 'package:airq_jyv/presentation/screens/home_screen.dart';
import 'package:airq_jyv/presentation/screens/map_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (homeContext) {
          return HomeScreen();
        });

      case '/home':
        return MaterialPageRoute(builder: (_) {
          return HomeScreen();
        });
      case '/map':
        return MaterialPageRoute(builder: (_) {
          return MapScreen();
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return HomeScreen();
        });
    }
  }
}
