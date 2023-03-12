import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mvvmstructure/data/network/BaseApiServices.dart';

import '../app_exception.dart';


class DioNetworkApi extends BaseApiServices {
  final dio = Dio();
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
    return responseJson;
  }

  @override
  Future postGetApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await dio.post(url, data:  data).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
      }

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 500:
      case 404:
        throw UnauthorizedException(response.data.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
  
  @override
  Future getGetApiResponseWithList(String url) {
    // TODO: implement getGetApiResponseWithList
    throw UnimplementedError();
  }
  
  
  
 
}
