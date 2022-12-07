import 'package:flutter/material.dart';
import 'package:mvvmstructure/utils/utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:const Text("Home Screen"),
        elevation: 0,
       
      ), body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(onPressed: () {
                //Utils.toastMessage("message");
                Utils.flushbarErrorMessage( "message",context);

              }, child: const Text("Click ME"),),
            ),
          ],
        ),
      ),
    );
  }
}