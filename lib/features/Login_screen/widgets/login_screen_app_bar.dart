import 'package:flutter/material.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/features/Login_screen/widgets/logo_text.dart';

class LoginScreenAppBar extends StatelessWidget {
  const LoginScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        LogoText(),
        Expanded(child: SizedBox()),
        Icon(
          Icons.close,
          color: AppColor.blackColor,
          size: 28,
        ),
      ],
    );
  }
}
