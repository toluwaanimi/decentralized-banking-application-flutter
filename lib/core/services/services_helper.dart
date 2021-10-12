import 'dart:io';

import 'package:bank_app/core/globals.dart';
import 'package:dio/dio.dart';

class ServiceHelper {
  Dio _dio;

  ServiceHelper() {

    final options = BaseOptions(
      baseUrl: Urls.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    if (_dio == null) _dio = Dio(options);

    Map<String, String> headers = {
      if (userToken != null) HttpHeaders.authorizationHeader: 'Bearer $userToken',
      Headers.acceptHeader: '*/*',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    _dio.options.headers = headers;
  }

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, {Map<String, String> body}) async {
    return await _dio.post(
      url,
      data: body,
    );
  }

  Future<Response> put(String url, {Map<String, String> body}) async {
    return await _dio.delete(
      url,
      data: body,
    );
  }

  Future<Response> delete(String url, {Map<String, String> body}) async {
    return await _dio.delete(
      url,
      data: body,
    );
  }
}

class Urls {
  static const String baseUrl = 'https://staging.maze.africa';
  static const String loginUrl = '/auth/login';
  static const String signUpUrl = '/auth/register';
  static const String getProfile = '/account';
  static const String getWallet = '/wallet';
  static const String getCard = '/wallet/card';
  static const String resolveAccountNumber = '/wallet/resolve';
  static const String transactions = '/transaction';
}

class ApiReponse<T> {
  ApiReponse({
    this.data,
    this.message,
    this.error,
  });

  T data;
  String message;
  bool error;
}

class DioExceptions implements Exception {
  String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to server was cancelled.";
        break;
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        message =
            "Connection to server failed. Please check your internet conenction.";
        break;
      case DioErrorType.response:
        switch (dioError.response.statusCode) {
          case 404:
          case 500:
            message = 'An error occured, please try again.';
            break;
          case 400:
            message = dioError.response.data['message'];
            break;
          default:
            message = 'Oops something went wrong!';
            break;
        }
        break;
      default:
        message = "Something went wrong, try again.";
        break;
    }
  }

  @override
  String toString() => message;
}
