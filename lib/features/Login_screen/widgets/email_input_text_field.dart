import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theming/colors.dart';

class EmailTextInputField extends StatefulWidget {
  const EmailTextInputField({
    super.key,
    required this.controller,
    required this.formKey,
  });
  final TextEditingController controller;
  final Key formKey;

  @override
  State<EmailTextInputField> createState() => _EmailTextInputFieldState();
}

class _EmailTextInputFieldState extends State<EmailTextInputField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter email';
          }
          return null;
        },
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 1.w),
          labelText: 'Email Address',
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
