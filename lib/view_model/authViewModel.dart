// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmstructure/repository/AuthRepository/auth_repository.dart';
import 'package:mvvmstructure/utils/routes/route_name.dart';
import 'package:mvvmstructure/utils/utility.dart';

class AuthViewModel with ChangeNotifier {
  final myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setLoading(true);
    myRepo.login(data).then((value) {
      setLoading(false);
      Utils.flushbarErrorMessage("Login Successfully", context);
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.home ,(route) => false);

      if (kDebugMode) {
        log(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushbarErrorMessage(error.toString(), context);
        log(error.toString());
      }
    });
  }

 Future<void> signUp(dynamic data, BuildContext context) async {
    setLoading(true);
    myRepo.login(data).then((value) {
      setLoading(false);
      Utils.flushbarErrorMessage("SignUp Successfully", context);
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false);

      if (kDebugMode) {
        log(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushbarErrorMessage(error.toString(), context);
        log(error.toString());
      }
    });
  }


}
