import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/utils/validator.dart';
import 'package:maro/featuers/Authentication/Data/cubit/auth_cubit.dart';
import 'package:maro/featuers/Authentication/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login Successful!')),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
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
                        Container(
                          width: 290.w,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _phoneNumberController,
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
                            // validator: (value) {
                            //   if (!Validator.isSaudiPhoneNumber(value)) {
                            //     return "Please Enter valid Number";
                            //   }
                            //   return null;
                            // },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
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
                          context.read<AuthCubit>().loginUser(
                                phoneNumber: _phoneNumberController.text,
                              );
                        }
                      },
                      child: Text(
                        "Login".tr(),
                        style: getBoldWhite14Style(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                    child: Text(
                      "Create Account".tr(),
                      style: getBoldBlue16Style(),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    width: 210.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Sign in with Google",
                        style: getBoldBlue14Style(),
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
