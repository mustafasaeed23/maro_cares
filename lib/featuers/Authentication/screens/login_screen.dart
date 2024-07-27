import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:maro/core/constence/Strings.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/utils/utills.dart';
import 'package:maro/featuers/Authentication/screens/auth_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNumber = '';
  var formkey = GlobalKey<FormState>();

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
                  Navigator.of(context).pushNamed(AuthScreen.routeName);
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
      body: Form(
        key: formkey,
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
                        onChanged: (text) {
                          phoneNumber = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Phone Number".tr();
                          }
                          // else if (text.length < 12) {
                          //   return "Phone Number should be at least 12 Number"
                          //       .tr();
                          // }
                          return null;
                        },
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
                      backgroundColor: MyTheme.mainPrimaryColor4),
                  onPressed: () async {
                    if (formkey.currentState?.validate() == true) {
                      await _loginUser(phoneNumber);
                    }
                  },
                  child: Text(
                    "Sign up".tr(),
                    style: getBoldWhite14Style(),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, register);
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
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loginUser(String phoneNumber) async {
    var headers = {
      'language': 'ar',
      'Content-Type': 'application/json',
    };

    var data = json.encode({
      "phoneNumber": phoneNumber,
    });

    var dio = Dio();

    try {
      var response = await dio.post(
        'https://maro-cares-z86j.onrender.com/login',
        options: Options(
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        // Show success dialog
        showSuccessDialogLogin(context);
      } else {
        showErrorDialogLogin(response.statusMessage ?? 'Unknown error');
      }
    } catch (e) {
      showErrorDialogLogin('Failed to login: $e');
    }
  }

  void showErrorDialogLogin(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
