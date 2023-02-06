import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '/data/remote/api_services.dart';

class DioLogger {
  static Dio getDio() {
    Dio dio = Dio();

    dio.options.baseUrl = Endpoints.baseUrl;

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'tenant': 'root',
    };
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        request: true,
        compact: true,
        error: true,
        responseHeader: true,
        logPrint: (object) {
          log(object.toString());
        },
      ),
    );
    return dio;
  }
}
