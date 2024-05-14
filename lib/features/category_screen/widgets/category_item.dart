import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theming/app_styles.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/data/models/respons/category/category_response_model.dart';

class CategoryItemLeft extends StatelessWidget {
  const CategoryItemLeft({
    super.key,
    required this.data,
  });
  final Datum data;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.mainCategoryArab, style: Appstyles.font16blackRegular),
                  SizedBox(height: 10.h),
                  Text(data.mainCategoryAbri, style: Appstyles.font12blackRegular),
                ],
              ),
            ),
            SizedBox(width: 30.w),
            Expanded(
              child: CachedNetworkImage(
                imageUrl: data.mainCategoryPhoto,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItemRight extends StatelessWidget {
  const CategoryItemRight({
    super.key,
    required this.data,
  });
  final Datum data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: data.mainCategoryPhoto,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 30.w),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(data.mainCategoryArab, style: Appstyles.font16blackRegular),
                  SizedBox(height: 10.h),
                  Text(data.mainCategoryAbri, style: Appstyles.font12blackRegular),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
