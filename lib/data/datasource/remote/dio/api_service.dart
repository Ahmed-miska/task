import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/data/api_url/api_urls.dart';
import '../../../../core/utils/app_constants.dart';

class ApiService {
  final String _baseUrl = AppURL.baseUrl;
  final Dio _dio;
  late String token;
  final SharedPreferences sharedPreferences;

  ApiService(this._dio, this.sharedPreferences) {
    token = sharedPreferences.getString(AppConstants.userTOKEN) ?? '';
    _dio
      ..options.baseUrl = _baseUrl
      ..httpClientAdapter
      ..options.headers = {
        'token': token,
      };
  }

  Future<Response> get({required String endpoint, Map<String, dynamic>? query}) async {
    try {
      var response = await _dio.get('$_baseUrl$endpoint', queryParameters: query);
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String endpoint, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        '$_baseUrl$endpoint',
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  void updateHeader({String? token}) {
    token = token ?? this.token;
    this.token = token;
    _dio.options.headers = {
      'token': token,
    };
  }
}
