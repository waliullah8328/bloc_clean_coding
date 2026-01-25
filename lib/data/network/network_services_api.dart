import 'dart:convert';
import 'dart:io';

import 'package:bloc_clean_coding/data/exceptions/app_exceptions.dart';
import 'package:bloc_clean_coding/data/network/base_api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkServicesDio implements BaseApiServices {
  late final Dio _dio;

  NetworkServicesDio() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 50),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer YOUR_TOKEN', // add dynamically if needed
        },
      ),
    );

    // ---------------- Interceptor for full logging ----------------
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            debugPrint('➡️ REQUEST');
            debugPrint('URL: ${options.uri}');
            debugPrint('METHOD: ${options.method}');
            debugPrint('HEADERS: ${options.headers}');
            debugPrint('BODY: ${_prettyPrint(options.data)}');
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            debugPrint('✅ RESPONSE');
            debugPrint('STATUS: ${response.statusCode}');
            debugPrint('BODY: ${_prettyPrint(response.data)}');
          }
          handler.next(response);
        },
        onError: (DioException error, handler) {
          if (kDebugMode) {
            debugPrint('❌ ERROR');
            debugPrint('TYPE: ${error.type}');
            debugPrint('MESSAGE: ${error.message}');
            debugPrint('URL: ${error.requestOptions.uri}');
            if (error.response != null) {
              debugPrint('STATUS: ${error.response?.statusCode}');
              debugPrint('ERROR BODY: ${_prettyPrint(error.response?.data)}');
            }
          }
          handler.next(error);
        },
      ),
    );
  }

  // ======================= GET =======================
  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response = await _dio.get(url);
      return _returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    }
  }

  // ======================= POST =======================
  @override
  Future<dynamic> postApi(String url, data) async {
    try {
      final response = await _dio.post(url, data: data);
      return _returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    }
  }

  // ======================= PUT =======================
  @override
  Future<dynamic> putApi(String url, data) async {
    try {
      final response = await _dio.put(url, data: data);
      return _returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    }
  }

  // ======================= DELETE =======================
  @override
  Future<dynamic> deleteApi(String url) async {
    try {
      final response = await _dio.delete(url);
      return _returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    }
  }

  // ======================= RESPONSE HANDLER =======================
  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        if (kDebugMode) {
          debugPrint('✅ RETURN DATA: ${_prettyPrint(response.data)}');
        }
        return response.data;

      case 400:
        throw FetchDataException('Bad request');

      case 401:
        throw UnAuthorisedException();

      case 404:
        throw FetchDataException('API not found (404)');

      case 500:
      default:
        throw FetchDataException(
          'Server error: ${response.statusCode}',
        );
    }
  }

  // ======================= ERROR HANDLER =======================
  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return RequestTimeOutException('Request timeout');

      case DioExceptionType.connectionError:
        return NoInternetException('No Internet Connection');

      case DioExceptionType.badResponse:
        return FetchDataException(
          _prettyPrint(error.response?.data) ,
        );

      default:
        return FetchDataException(
          error.message ?? 'Something went wrong',
        );
    }
  }

  // ======================= PRETTY PRINT =======================
  String _prettyPrint(dynamic data) {
    try {
      if (data == null) return 'null';
      if (data is String) return data;
      return const JsonEncoder.withIndent('  ').convert(data);
    } catch (e) {
      return data.toString();
    }
  }
}
