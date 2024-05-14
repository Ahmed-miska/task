import 'package:dio/dio.dart';
import 'package:task/data/api_url/api_urls.dart';
import 'package:task/data/datasource/remote/dio/api_service.dart';
import 'package:task/data/datasource/remote/exception/api_error_handler.dart';
import 'package:task/data/models/respons/base/api_response.dart';
import 'package:task/data/repos/save_user_data.dart';

class CategoryRepo {
  final ApiService apiService;
  final SaveUserData saveUserData;

  CategoryRepo(this.apiService, this.saveUserData);

  Future<ApiResponse> getCat() async {
    try {
      Response response = await apiService.post(AppURL.category);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
