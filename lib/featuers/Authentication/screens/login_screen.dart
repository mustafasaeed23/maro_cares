import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/widgets/custom_text_form_field.dart';
import 'package:maro/featuers/Authentication/Data/cubit/auth_cubit.dart';
import 'package:maro/featuers/Authentication/google_signIn/google_signIn_widget.dart';
import 'package:maro/featuers/Authentication/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          "Profile".tr(),
          style: getBoldBlack14Style(),
        ),
        leadingWidth: 65,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RegisterScreen.routeName);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 28,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            _showSuccessDialog(context, "Login Successful!".tr());
          } else if (state is AuthFailure) {
            _showFailureDialog(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset(
                      'assets/animations/Animation - 1718245911646.json',
                      width: 250.w,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: CustomTextFormField(
                            controller: _phoneNumberController,
                            inputType: TextInputType.number,
                            width: 200.w,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          flex: 2,
                          child: CustomTextFormField(
                            text: "+966",
                            width: 130.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    height: 45.h,
                    width: 300.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyTheme.mainPrimaryColor4,
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          context.read<AuthCubit>().loginUser(
                                phoneNumber: _phoneNumberController.text, userName: '',
                              );
                        }
                      },
                      child: Text(
                        "Login".tr(),
                        style: getBoldWhite14Style(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                    child: Text(
                      "Create Account".tr(),
                      style: getBoldBlue16Style(),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  const GoogleSigninWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Success".tr()),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showFailureDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error".tr()),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
