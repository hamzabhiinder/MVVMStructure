import 'package:flutter/material.dart';
import 'package:mvvmstructure/utils/routes/route_name.dart';
import 'package:mvvmstructure/utils/routes/routes.dart';
import 'package:mvvmstructure/view_model/authViewModel.dart';
import 'package:mvvmstructure/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => UserViewViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
