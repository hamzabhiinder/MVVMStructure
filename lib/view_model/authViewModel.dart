// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmstructure/repository/AuthRepository/auth_repository.dart';
import 'package:mvvmstructure/utils/utility.dart';

class AuthViewModel with ChangeNotifier {
  final myRepo = AuthRepository();

  Future<void> login(dynamic data, BuildContext context) async {
    myRepo.login(data).then((value) {
      if (kDebugMode) {
        log(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.flushbarErrorMessage(error.toString(), context);
        log(error.toString());
      }
    });
  }
}
