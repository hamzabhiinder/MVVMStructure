import 'package:flutter/material.dart';
import 'package:mvvmstructure/view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    SplashServices splashServices=SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(fontSize: 40),
        ),
      )),
    );
  }
}
