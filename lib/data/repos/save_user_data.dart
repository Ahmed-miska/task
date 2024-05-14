import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/core/utils/app_constants.dart';
import 'package:task/data/datasource/remote/dio/api_service.dart';
import 'package:task/data/models/respons/auth/login_response_model.dart';

class SaveUserData {
  final SharedPreferences sharedPreferences;
  final ApiService apiService;

  SaveUserData({required this.sharedPreferences, required this.apiService});

  /// save SharedData

  Future<void> saveUserData(Data userData) async {
    String userSavedData = json.encode(userData);
    try {
      await sharedPreferences.setString(AppConstants.userData, userSavedData);
    } catch (e) {
      rethrow;
    }
    apiService.updateHeader(token: userData.token);
  }

  Future<void> saveUserToken(String userTOKEN) async {
    apiService.updateHeader(token: userTOKEN);
    try {
      await sharedPreferences.setString(AppConstants.userTOKEN, userTOKEN);
    } catch (e) {
      rethrow;
    }
  }

  ///get SharedData
  Data? getUserData() {
    String? userSavedData = sharedPreferences.getString(AppConstants.userData);
    if (userSavedData != null) {
      Map<String, dynamic> userData = json.decode(userSavedData);
      Data userModel = Data.fromJson(userData);
      return userModel;
    }
    return null;
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.userTOKEN) ?? "";
  }
}
