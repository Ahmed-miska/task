import 'package:flutter/material.dart';
import 'package:task/core/theming/colors.dart';

class LogoText extends StatelessWidget {
  const LogoText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: "Buy",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
          TextSpan(
            text: "&",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              color: AppColor.blackColor,
            ),
          ),
          TextSpan(
            text: "Sell",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
