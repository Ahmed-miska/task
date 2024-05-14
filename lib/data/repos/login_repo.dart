import 'package:dio/dio.dart';
import 'package:task/data/api_url/api_urls.dart';
import 'package:task/data/datasource/remote/dio/api_service.dart';
import 'package:task/data/datasource/remote/exception/api_error_handler.dart';
import 'package:task/data/models/body/login_request_model.dart';
import 'package:task/data/models/respons/base/api_response.dart';
import 'package:task/data/repos/save_user_data.dart';

class LoginRepo {
  final ApiService apiService;
  final SaveUserData saveUserData;

  LoginRepo(this.apiService, this.saveUserData);

  Future<ApiResponse> login(LoginRequestBody requestBody) async {
    try {
      FormData formData = FormData.fromMap(
        {
          "Phone": "+2${requestBody.phone}",
          "Password": requestBody.password,
        },
      );
      Response response = await apiService.post(
        AppURL.login,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
