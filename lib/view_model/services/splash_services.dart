import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmstructure/Model/userModel.dart';
import 'package:mvvmstructure/utils/routes/route_name.dart';
import 'package:mvvmstructure/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context){
    getUserData().then((value) async {
      log(value.token.toString());
      // if (value.token == null || value.token == "") {
      //    await Future.delayed(const Duration(seconds: 3));
      //   Navigator.pushNamedAndRemoveUntil(
      //       context, RoutesName.login, (route) => false);
      // } else {
      //   await Future.delayed(const Duration(seconds: 3));
        
      //   Navigator.pushNamedAndRemoveUntil(
      //       context, RoutesName.home, (route) => false);
      // }

      await Future.delayed(const Duration(seconds: 3));
        
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.home, (route) => false);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        log(error.toString());
      }
    });
  }
}
