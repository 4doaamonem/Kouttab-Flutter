import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kottab_app/config/network/auth_interceptor.dart';
import 'package:kottab_app/config/network/pretty_dio_logger_interceptor.dart';
import 'package:kottab_app/core/api_end_points/api_end_points.dart';

@module
abstract class AppModule {
  @singleton
  Dio dio(PrettyDioLoggerInterceptor loggerInterceptor,AuthInterceptor authInterceptor,){
    final dio=Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      )
    );
    dio.interceptors.add(authInterceptor);
    if (kDebugMode) {
      dio.interceptors.add(loggerInterceptor);
    }
    return dio;
  }

  @singleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}