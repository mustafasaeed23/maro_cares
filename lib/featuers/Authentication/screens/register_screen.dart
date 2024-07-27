import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Authentication/screens/login_screen.dart'; // Adjust this import based on your file structure

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'Create_Account';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String userName = '';
  String email = '';
  String phoneNumber = '';
  String invitationBy = '';

  final formkey = GlobalKey<FormState>();
  final dio = Dio(); // Initialize Dio here or use dependency injection

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
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70.h,
              ),
              Center(
                child: Lottie.asset(
                  "assets/animations/Animation - 1718264964019.json",
                  height: 200.h,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                child: Container(
                  width: 290.w,
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("User Name").tr(),
                      labelStyle: getBoldBlack16Style(),
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
                    onChanged: (text) {
                      userName = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Please Enter Your Name".tr();
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.email,
                      size: 30,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Container(
                      width: 290.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text("Email").tr(),
                          labelStyle: getBoldBlack16Style(),
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
                        onChanged: (text) {
                          email = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Your Email".tr();
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(text)) {
                            return "Invalid Email Address".tr();
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
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
                          label: Text("Phone No.".tr()),
                          labelStyle: getBoldBlack16Style(),
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
                        onChanged: (text) {
                          phoneNumber = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Phone Number".tr();
                          } else if (text.length < 12) {
                            return "Phone Number should be at least 12 Number".tr();
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
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
                    Container(
                      width: 290.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text("Invitation By".tr()),
                          labelStyle: getBoldBlack16Style(),
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
                        onChanged: (text) {
                          invitationBy = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Invitation Code".tr();
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                width: 300.w,
                height: 52.h,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyTheme.mainPrimaryColor4),
                    onPressed: () async {
                      if (formkey.currentState?.validate() == true) {
                        await _registerUser(userName, email, phoneNumber, invitationBy);
                      }
                    },
                    child: Text(
                      "Create Account".tr(),
                      style: getBoldWhite18Style(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _registerUser(String userName, String email, String phoneNumber, String invitationBy) async {
    var headers = {
      'language': 'ar',
      'Content-Type': 'application/json',
    };

    var data = json.encode({
      "userName": userName,
      "email": email,
      "phoneNumber": phoneNumber,
      "invitationBy": invitationBy,
    });

    try {
      var response = await dio.post(
        'https://maro-cares-z86j.onrender.com/auth/register',
        options: Options(
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        _showSuccessDialog();
      } else {
        _showErrorDialog(response.statusMessage ?? 'Unknown error');
      }
    } catch (e) {
      _showErrorDialog('Failed to register user: $e');
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Registration successful!'),
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

  void _showErrorDialog(String message) {
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
