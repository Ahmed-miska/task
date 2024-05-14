import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/data/models/body/login_request_model.dart';
import 'package:task/data/models/respons/auth/login_response_model.dart';
import 'package:task/data/models/respons/base/api_response.dart';
import 'package:task/data/repos/login_repo.dart';
import 'package:task/data/repos/save_user_data.dart';
import 'package:task/features/main_screen/main_screen.dart';
import '../../core/helpers/extentions.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepo loginRepo;
  final SaveUserData saveUserData;

  LoginProvider({
    required this.loginRepo,
    required this.saveUserData,
  });

  TextEditingController phoneController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  final phoneFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool get isLloading => isLoading;

  Future<ApiResponse> login(LoginRequestBody body) async {
    isLoading = true;
    notifyListeners();

    var responseModel = await loginRepo.login(body);

    if (responseModel.response != null) {
      isLoading = false;
      notifyListeners();
      var loginBody = jsonDecode(responseModel.response!.data);
      if (loginBody is Map<String, dynamic>) {
        loginBody = LoginResponseModel.fromJson(loginBody);
      }
      if (loginBody?.success == true) {
        saveUserData.saveUserData(loginBody!.data!);
        saveUserData.saveUserToken(loginBody!.data!.token!);
        push(const MainScreen());
      } else {
        Fluttertoast.showToast(msg: loginBody?.message ?? "Login failed");
      }
    } else {
      isLoading = false;
      Fluttertoast.showToast(msg: "Wrong Phone Number OR Password");
    }
    isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
