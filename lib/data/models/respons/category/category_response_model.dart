class CategoryResponseModel {
  int statusCode;
  bool success;
  List<Datum> data;
  String message;

  CategoryResponseModel({
    required this.statusCode,
    required this.success,
    required this.data,
    required this.message,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => CategoryResponseModel(
        statusCode: json["status_code"],
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  String mainCategoryInTopId;
  String topCategoryId;
  String mainCategoryArab;
  String mainCategoryEng;
  String mainCategoryAbri;
  String mainCategoryPhoto;
  String catStatus;
  String categoryTarteb;
  String shopsNum;

  Datum({
    required this.mainCategoryInTopId,
    required this.topCategoryId,
    required this.mainCategoryArab,
    required this.mainCategoryEng,
    required this.mainCategoryAbri,
    required this.mainCategoryPhoto,
    required this.catStatus,
    required this.categoryTarteb,
    required this.shopsNum,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        mainCategoryInTopId: json["MainCategoryInTopID"],
        topCategoryId: json["TopCategoryID"],
        mainCategoryArab: json["MainCategoryArab"],
        mainCategoryEng: json["MainCategoryEng"],
        mainCategoryAbri: json["MainCategoryAbri"],
        mainCategoryPhoto: json["MainCategoryPhoto"],
        catStatus: json["catStatus"]!,
        categoryTarteb: json["CategoryTarteb"],
        shopsNum: json["ShopsNum"],
      );

  Map<String, dynamic> toJson() => {
        "MainCategoryInTopID": mainCategoryInTopId,
        "TopCategoryID": topCategoryId,
        "MainCategoryArab": mainCategoryArab,
        "MainCategoryEng": mainCategoryEng,
        "MainCategoryAbri": mainCategoryAbri,
        "MainCategoryPhoto": mainCategoryPhoto,
        "catStatus": catStatus,
        "CategoryTarteb": categoryTarteb,
        "ShopsNum": shopsNum,
      };
}
