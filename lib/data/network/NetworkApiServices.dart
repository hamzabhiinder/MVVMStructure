// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvmstructure/data/app_exception.dart';
import 'package:mvvmstructure/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 15));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Exception");
    }
    return responseJson;
  }

  @override
  Future postGetApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 15),);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Exception");
    }
    return responseJson;

  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException();
      case 404:
        throw UnauthorizedException();

      default:
        throw FetchDataException(
            "Error Occured While Communicating with Server with Status Code ${response.statusCode}");
    }
  }
}
