import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/core/theming/app_styles.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/data/providers/cat_provider.dart';
import 'package:task/features/category_screen/widgets/category_item.dart';
import 'package:task/features/main_screen/widgets/loading_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<CategoryProvider>(context, listen: false).getCategoryy();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, provider, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10.h),
            width: double.infinity,
            color: AppColor.whiteColor,
            child: Center(
              child: Text(
                provider.userName,
                style: Appstyles.font20WithBold.copyWith(color: AppColor.blackColor),
              ),
            ),
          ),
          Expanded(
            child: provider.isFailure
                ? Center(child: Text('Server error', style: Appstyles.font20WithBold))
                : ListView.builder(
                    itemCount: provider.isloading ? 4 : provider.categoryModelList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      child: provider.isloading
                          ? LoadingWidget(
                              width: double.infinity,
                              height: 130.h,
                            )
                          : index % 2 == 0
                              ? CategoryItemLeft(data: provider.categoryModelList[index])
                              : CategoryItemRight(data: provider.categoryModelList[index]),
                    ),
                  ),
          ),
        ],
      );
    });
  }
}
