import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/constence/Strings.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/widgets/appbar_screens.dart';
import 'package:maro/core/widgets/custom_text_form_field.dart';
import 'package:dio/dio.dart'; // Import Dio for API requests

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _isLoading = false;
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    _otpController.addListener(_checkIfOtpIsEntered);
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _checkIfOtpIsEntered() {
    setState(() {
      _isButtonEnabled = _otpController.text.isNotEmpty;
    });
  }

  Future<void> _verifyAccount() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var response = await _dio.put(
        'https://maro-cares-z86j.onrender.com/user/verificationAccount',
        data: {
          "phoneNumber": widget.phoneNumber,
          "code": _otpController.text,
        },
        options: Options(headers: {
          'language': 'ar',
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        // OTP is correct, navigate to the home page
        Navigator.of(context).pushNamed(home);
      } else {
        _showErrorDialog(
            context, "The code entered is incorrect, please try again.");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error".tr()),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK".tr()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreens(context, "Verification".tr()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Enter OTP sent to ${widget.phoneNumber}",
              style: getBoldBlack14Style(),
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
              controller: _otpController,
              text: "OTP".tr(),
            ),
            SizedBox(height: 40.h),
            SizedBox(
              width: 250.w,
              height: 52.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isButtonEnabled
                      ? MyTheme.mainPrimaryColor4
                      : Colors.grey,
                ),
                onPressed:
                    _isButtonEnabled && !_isLoading ? _verifyAccount : null,
                child: _isLoading
                    ? CircularProgressIndicator(
                        color:
                            MyTheme.mainPrimaryColor4) // Show loading indicator
                    : Text(
                        "Verify".tr(),
                        style: _isButtonEnabled
                            ? getMediumWhite12Style()
                            : getRegularBlack14Style(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
