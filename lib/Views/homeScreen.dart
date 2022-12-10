import 'package:flutter/material.dart';
import 'package:mvvmstructure/Model/userModel.dart';
import 'package:mvvmstructure/data/response/status.dart';
import 'package:mvvmstructure/utils/utility.dart';
import 'package:mvvmstructure/view_model/home_view_view_model.dart';
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
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    homeViewViewModel.fetchUniversityList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = Provider.of<UserViewViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          ElevatedButton(
            onPressed: () {
              sharedPreferences.remove();
              Utils.flushbarErrorMessage("LogOut", context);
              Navigator.pushNamedAndRemoveUntil(
                  context, RoutesName.login, (route) => false);
            },
            child: const Icon(Icons.logout_outlined),
          ),
        ],
        elevation: 0,
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (_) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, child) {
            switch (value.universityList.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return  Center(child:Text( value.universityList.message.toString()));
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount:value.universityList.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(child: Column(
                      children: [
                     Text(value.universityList.data[index]["name"].toString()),
                        // Text(value.universityList.data[index]["country"].toString()),

                      ],
                    ),);
                  },
                );

              default:
              return Container();
            }
          },
        ),
      ),
    );
  }
}
