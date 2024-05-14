import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/core/helpers/extentions.dart';
import 'package:task/core/theming/app_styles.dart';
import 'package:task/data/models/body/login_request_model.dart';
import 'package:task/data/providers/login_provider.dart';
import 'package:task/features/Login_screen/widgets/app_text_button.dart';
import 'package:task/features/Login_screen/widgets/dont_have_account_text.dart';
import 'package:task/features/Login_screen/widgets/email_input_text_field.dart';
import 'package:task/features/Login_screen/widgets/login_screen_app_bar.dart';
import 'package:task/features/Login_screen/widgets/password_input_text_field.dart';
import 'package:task/features/main_screen/main_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
          child: Consumer<LoginProvider>(
            builder: (context, provider, _) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoginScreenAppBar(),
                    SizedBox(height: 28.h),
                    Text('Welcome Back !', style: Appstyles.font24BlackSemiBold),
                    SizedBox(height: 28.h),
                    EmailTextInputField(
                      formKey: provider.phoneFormKey,
                      controller: provider.phoneController,
                    ),
                    SizedBox(height: 28.h),
                    PasswordTextInputField(
                      controller: provider.passWordController,
                      formKey: provider.passwordFormKey,
                    ),
                    SizedBox(height: 28.h),
                    Align(alignment: Alignment.centerRight, child: Text('Forgot Password ?', style: Appstyles.font15blackRegular)),
                    SizedBox(height: 28.h),
                    AppTextButton(
                      isLoading: provider.isLloading,
                      onTap: () {
                        if (provider.phoneFormKey.currentState!.validate() && provider.passwordFormKey.currentState!.validate()) {
                          provider.login(
                            LoginRequestBody(
                              phone: provider.phoneController.text,
                              password: provider.passWordController.text,
                            ),
                          );
                        }

                        // push(const MainScreen());
                      },
                    ),
                    SizedBox(height: 30.h),
                    const DontHaveAccountText(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
