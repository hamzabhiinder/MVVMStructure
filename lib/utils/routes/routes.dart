import 'package:flutter/material.dart';
import 'package:mvvmstructure/Views/SignUp.dart';
import 'package:mvvmstructure/Views/homeScreen.dart';
import 'package:mvvmstructure/Views/login.dart';
import 'package:mvvmstructure/utils/routes/route_name.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
        case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUp(),
        );


      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("No Routes Define")),
          );
        });
    }
  }
}
