import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Authentication/Data/cubit/auth_cubit.dart';

class VerificationScreen extends StatefulWidget {
  static const String routeName = 'Verification_Screen';

  final String phoneNumber;

  VerificationScreen({super.key, required this.phoneNumber});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _otpController.addListener(_onOtpChanged);
  }

  @override
  void dispose() {
    _otpController.removeListener(_onOtpChanged);
    _otpController.dispose();
    super.dispose();
  }

  void _onOtpChanged() {
    setState(() {
      _isButtonEnabled = _otpController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verify Account".tr(),
          style: getBoldBlack18Style().copyWith(color: MyTheme.mainPrimaryColor4),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthVerificationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Verification Successful!")),
            );
            Navigator.of(context).pushNamed('/home');
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter the OTP sent to ${widget.phoneNumber}",
                    style: getSemiBoldBlack14Style(),
                  ),
                  SizedBox(height: 30.h),
                  TextFormField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                      hintText: "OTP",
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "OTP can't be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    width: 200.w,
                    height: 55.h,
                    child: ElevatedButton(
                      onPressed: _isButtonEnabled
                          ? () {
                              if (_formKey.currentState?.validate() == true) {
                                context.read<AuthCubit>().verifyAccount(
                                      phoneNumber: widget.phoneNumber,
                                      code: _otpController.text,
                                    );
                              }
                            }
                          : null, // Disabled when button is not enabled
                      child: Text(
                        "Verify".tr(),
                        style: getBoldBlue14Style(),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isButtonEnabled
                            ? MyTheme.mainPrimaryColor4
                            : Colors.grey, 
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
