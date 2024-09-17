import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:maro/core/constence/Strings.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Authentication/Data/cubit/auth_cubit.dart';
import 'package:maro/featuers/Authentication/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'Create_Account';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _userNameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _invatationByController = TextEditingController();

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
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
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
            _showSuccessDialog(context, state.phoneNumber);
          } else if (state is AuthFailure) {
            _showFailureDialog(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Lottie.asset(
                      'assets/animations/Animation - 1718245911646.json',
                      width: 250.w,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SizedBox(
                          width: 290.w,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: _userNameController,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              label: Text("User Name".tr()),
                              labelStyle: getBoldBlack16Style(),
                              fillColor: MyTheme.ColorContainer,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "UserName can't be empty".tr();
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.phone_android_rounded,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SizedBox(
                          width: 290.w,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _mobileNumberController,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              label: Text("Phone No.".tr()),
                              labelStyle: getBoldBlack16Style(),
                              fillColor: MyTheme.ColorContainer,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Enter Phone Number".tr();
                              }
                              if (text.length < 9) {
                                return "Wrong Phone Number, should contain 9 numbers"
                                    .tr();
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.code,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SizedBox(
                          width: 290.w,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _invatationByController,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              label: Text("InvationBy".tr()),
                              labelStyle: getBoldBlack16Style(),
                              fillColor: MyTheme.ColorContainer,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 45.h,
                    width: 300.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyTheme.mainPrimaryColor4,
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          context.read<AuthCubit>().registerUser(
                                userName: _userNameController.text,
                                email: '',
                                phoneNumber: _mobileNumberController.text,
                                invitationBy: _invatationByController.text,
                              );
                        }
                      },
                      child: Text(
                        "Register".tr(),
                        style: getBoldWhite14Style(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: Text(
                      "Sign In".tr(),
                      style: getBoldBlue16Style(),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  // SizedBox(
                  //   width: 210.w,
                  //   height: 50.h,
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     child: Text(
                  //       "Sign in with Google",
                  //       style: getBoldBlue14Style(),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, String phoneNumber) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Registration Successful".tr()),
          content: Text("Please check your phone for the OTP.".tr()),
          actions: [
            TextButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(profileUserScreen, arguments: {
                //   'userName': _userNameController.text,
                //   'phoneNumber': phoneNumber,
                // });
                Navigator.of(context)
                    .pushNamed(verificationScreen, arguments: phoneNumber);
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
          title: Text("Registration Failed".tr()),
          content: Text(errorMessage
              .tr()), // Assuming `errorMessage` is already translated
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
