import 'package:flutter/material.dart';
import 'package:task/core/theming/app_styles.dart';
import 'package:task/core/theming/colors.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account? ', style: Appstyles.font15blackRegular),
        Text(
          'Sign Up',
          style: Appstyles.font15blackRegular.copyWith(color: AppColor.blackColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
