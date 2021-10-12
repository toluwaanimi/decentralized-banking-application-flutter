import 'package:bank_app/core/services/services_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthService {
  AuthService() {
    _serviceHelper = ServiceHelper();
  }

  ServiceHelper _serviceHelper;

  Future<ApiReponse> login(
      {@required String email, @required String password}) async {
    ApiReponse apiReponse = ApiReponse(error: false);

    Map<String, String> body = {
      'email': email,
      'password': password,
    };
    try {
      Response response = await _serviceHelper.post(
        Urls.loginUrl,
        body: body,
      );
      debugPrint('in auth service response for login => ${response.data}');

      if (response.statusCode == 200) {
        apiReponse.data = response.data['data']['token'];
      } else {
        apiReponse.error = true;
        apiReponse.message =
            response.data['message'] ?? 'Something went wrong, try again.';
      }
    } on Exception catch (e) {
      apiReponse.error = true;
      apiReponse.message = DioExceptions.fromDioError(e).toString();
    }
    return apiReponse;
  }

  Future<ApiReponse> signUp({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
    @required String username,
  }) async {
    ApiReponse apiReponse = ApiReponse(error: false);

    Map<String, String> body = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'username': username,
      'password': password,
    };

    try {
      Response response = await _serviceHelper.post(
        Urls.signUpUrl,
        body: body,
      );
      debugPrint('in auth service response for signup => ${response.data}');

      if (response.statusCode == 201) {
        apiReponse.data = {
          'token': response.data['data']['token'],
          'user': response.data['data']['user'],
        };
      } else {
        apiReponse.error = true;
        apiReponse.message =
            response.data['message'] ?? 'Something went wrong, try again.';
      }
    } on Exception catch (e) {
      apiReponse.error = true;
      apiReponse.message = DioExceptions.fromDioError(e).toString();
    }
    return apiReponse;
  }
}
