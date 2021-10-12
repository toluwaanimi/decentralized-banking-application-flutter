import 'package:bank_app/core/services/services_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WalletService {
  WalletService() {
    _serviceHelper = ServiceHelper();
  }

  ServiceHelper _serviceHelper;

  Future<ApiReponse> getWallet() async {
    ApiReponse apiReponse = ApiReponse(error: false);

    try {
      Response response = await _serviceHelper.get(
        Urls.getWallet,
      );
      debugPrint(
          'in wallet service response for get wallet => ${response.data}');

      if (response.statusCode == 200) {
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

  Future<ApiReponse> getCard() async {
    ApiReponse apiReponse = ApiReponse(error: false);

    try {
      Response response = await _serviceHelper.get(
        Urls.getCard,
      );
      debugPrint('in wallet service response for get card => ${response.data}');

      if (response.statusCode == 200) {
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

  Future<ApiReponse> resolveAccountNumber({String accountNumber}) async {
    ApiReponse apiReponse = ApiReponse(error: false);

    Map<String, String> body = {
      'account_number': accountNumber,
    };

    try {
      Response response = await _serviceHelper.post(
        Urls.resolveAccountNumber,
        body: body,
      );
      debugPrint(
          'in wallet service response for resolve account number => ${response.data}');

      if (response.statusCode == 200) {
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
