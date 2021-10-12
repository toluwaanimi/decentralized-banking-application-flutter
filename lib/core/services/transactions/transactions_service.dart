import 'package:bank_app/core/services/services_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TransactionssService {
  TransactionssService() {
    _serviceHelper = ServiceHelper();
  }

  ServiceHelper _serviceHelper;

  Future<ApiReponse> getTransactions() async {
    ApiReponse apiReponse = ApiReponse(error: false);

    try {
      Response response = await _serviceHelper.get(
        Urls.transactions,
      );
      debugPrint(
          'in transaction service response for get transactions => ${response.data}');

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

  Future<ApiReponse> sendTransaction({String to, double amount}) async {
    ApiReponse apiReponse = ApiReponse(error: false);

    Map<String, String> body = {
      'to': to,
      'amount': '$amount',
    };

    try {
      Response response = await _serviceHelper.post(
        Urls.transactions,
        body: body,
      );
      debugPrint(
          'in transactions service response for send transaction => ${response.data}');

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
