import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/core/di/injection.dart';
import 'package:task/data/models/respons/base/api_response.dart';
import 'package:task/data/models/respons/category/category_response_model.dart';
import 'package:task/data/repos/category_repo.dart';
import 'package:task/data/repos/save_user_data.dart';

SaveUserData saveUserData = getIt();

class CategoryProvider with ChangeNotifier {
  final List<Datum> categoryModelList = [];
  final CategoryRepo categoryRepo;
  CategoryResponseModel? categoryModel;

  String userName = '${saveUserData.getUserData()!.fName} ${saveUserData.getUserData()!.lName}';

  CategoryProvider(this.categoryRepo);
  bool isloading = false;
  bool isFailure = false;

  Future<ApiResponse> getCategoryy() async {
    categoryModelList.clear();
    isloading = true;

    ApiResponse apiResponse = await categoryRepo.getCat();

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      try {
        if (apiResponse.response!.data is String) {
          var jsonData = json.decode(apiResponse.response!.data);
          categoryModel = CategoryResponseModel.fromJson(jsonData);
          isloading = false;
          notifyListeners();
        } else if (apiResponse.response!.data is Map<String, dynamic>) {
          categoryModel = CategoryResponseModel.fromJson(apiResponse.response!.data);
          isloading = false;
          notifyListeners();
        } else {
          isFailure = true;
          notifyListeners();
          throw const FormatException("Invalid response format");
        }
        if (categoryModel!.statusCode == 200) {
          categoryModelList.addAll(categoryModel!.data);
          isloading = false;
          notifyListeners();
        } else {
          isFailure = true;
          Fluttertoast.showToast(msg: 'Error: ${categoryModel!.message}');
        }
      } catch (e) {
        isFailure = true;
        notifyListeners();
        Fluttertoast.showToast(msg: 'Error: ${e.toString()}');
      }
    } else {
      isFailure = true;
      notifyListeners();
      Fluttertoast.showToast(msg: 'Server error: ${apiResponse.error}');
    }

    isloading = false;
    isFailure = false;
    notifyListeners();
    return apiResponse;
  }
}
