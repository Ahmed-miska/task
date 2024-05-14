import 'package:flutter/material.dart';
import 'package:task/core/theming/app_styles.dart';
import 'package:task/core/theming/colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onTap,
    required this.isLoading,
  });
  final void Function() onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isLoading ? Colors.grey : AppColor.primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(child: isLoading ? const CircularProgressIndicator(color: AppColor.whiteColor, strokeWidth: 4) : Text('SIGN IN', style: Appstyles.font20WithBold)),
        ),
      ),
    );
  }
}
