import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theming/colors.dart';

class PasswordTextInputField extends StatefulWidget {
  const PasswordTextInputField({
    super.key, required this.controller, required this.formKey,
  });
   final TextEditingController controller;
  final Key formKey;

  @override
  State<PasswordTextInputField> createState() => _PasswordTextInputFieldState();
}

class _PasswordTextInputFieldState extends State<PasswordTextInputField> {
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        controller: widget.controller,
        obscureText: passwordVisible,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter password';
          }
          return null;
        },
        decoration: InputDecoration(
          isDense: true,
          labelText: 'Password',
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            child: Text(
              passwordVisible ? 'Show' : 'Hide',
              style: TextStyle(color: AppColor.blackColor, fontSize: 12.sp),
            ),
          ),
        ),
      ),
    );
  }
}
