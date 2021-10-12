import 'package:bank_app/core/services/services_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProfileService {
  ProfileService() {
    _serviceHelper = ServiceHelper();
  }

  ServiceHelper _serviceHelper;

    Future<ApiReponse> getProfile() async {
    ApiReponse apiReponse = ApiReponse(error: false);

    try {
      Response response = await _serviceHelper.post(
        Urls.getProfile,
      );
      debugPrint(
          'in profile service response for get profile => ${response.data}');

      if (response.statusCode == 201) {
       
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
