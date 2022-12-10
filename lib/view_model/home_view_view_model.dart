import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mvvmstructure/data/response/api_response.dart';
import 'package:mvvmstructure/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final myRepo = HomeRepository();

  ApiResponse universityList = ApiResponse.loading();

  setUnivesityList(ApiResponse response) {
    universityList = response;
    notifyListeners();
  }

  Future<void> fetchUniversityList() async {
    setUnivesityList(ApiResponse.loading());

    myRepo.fetchUniversityList().then((value) {
      print(
          "------------------------------------------------------------------------");
      log(value.toString());
      setUnivesityList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setUnivesityList(ApiResponse.error(error.toString()));
    });
  }
}
