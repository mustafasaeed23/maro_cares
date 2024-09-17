import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/widgets/custom_text_form_field.dart';

class FillInformationWidget extends StatelessWidget {
  const FillInformationWidget(
      {super.key,
      required this.text,
      required this.width,
      this.validator,
      required TextEditingController controller});
  final String text;
  final double width;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: getBoldBlack14Style(),
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextFormField(
          width: width,
          validator: validator,
        ),
      ],
    );
  }
}
