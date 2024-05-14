import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theming/colors.dart';

class Appstyles {
  static TextStyle font24BlackSemiBold = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, color: AppColor.blackColor);
  static TextStyle font15blackRegular = TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: AppColor.blackColor);
    static TextStyle font16blackRegular = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColor.blackColor);

  static TextStyle font12blackRegular = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300, color: AppColor.blackColor.withOpacity(.8));

  static TextStyle font20WithBold = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColor.whiteColor);
}
