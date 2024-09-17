import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.text,
    this.validator,
    this.inputType,
    this.maxLength,
    this.width,
  });

  final TextEditingController? controller;
  final String? text;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final int? maxLength;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
          controller: controller,
          maxLength: maxLength,
          keyboardType: inputType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            hintText: text,
            hintStyle: getBoldBlack16Style(),
            fillColor: MyTheme.ColorContainer,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(15.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(15.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
          validator: validator),
    );
  }
}
