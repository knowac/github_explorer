import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:github_explorer/core/constants/urls.dart';

class ApiClient {
  ApiClient._();

  static final Dio instance = (() {
    final dio = Dio(
      BaseOptions(
        baseUrl: kGithubBase,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      );
    }
    return dio;
  })();
}
