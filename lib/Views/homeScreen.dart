import 'package:flutter/material.dart';
import 'package:mvvmstructure/Model/userModel.dart';
import 'package:mvvmstructure/utils/utility.dart';
import 'package:mvvmstructure/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/routes/route_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
  final sharedPreferences=Provider.of<UserViewModel>(context);

    return Scaffold(
   
      appBar: AppBar(
        title:const Text("Home Screen"),
        actions: [
          ElevatedButton(onPressed: () {
              
                sharedPreferences.remove();
                Utils.flushbarErrorMessage( "LogOut",context);
                Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.login, (route) => false);

              }, child: const Icon(Icons.logout_outlined),),
        ],
        elevation: 0,
       
      ), body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text("ello")
            ),
          ],
        ),
      ),
    );
  }
}