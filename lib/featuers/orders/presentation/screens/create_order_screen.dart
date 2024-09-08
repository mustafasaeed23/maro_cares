import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/utils/validator.dart';
import 'package:maro/core/widgets/appbar_screens.dart';
import 'package:maro/core/widgets/custom_text_form_field.dart';
import 'package:maro/featuers/orders/data/user_model.dart';
import 'package:maro/featuers/orders/data/user_model_service.dart';
import 'package:maro/featuers/orders/presentation/widgets/fill_information_widget.dart';

import 'package:dio/dio.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  _CreateOrderScreenState createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userAddressController = TextEditingController();
  final TextEditingController _userPhoneController = TextEditingController();
  final TextEditingController _userCityController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _couponController = TextEditingController();

  final Dio _dio = Dio();
  final String _baseUrl = 'https://maro-cares-z86j.onrender.com';

  void _submitOrder() async {
    if (_formKey.currentState!.validate()) {
      UserOrder order = UserOrder(
        userName: _userNameController.text,
        userAddress: _userAddressController.text,
        userPhone: _userPhoneController.text,
        userCity: _userCityController.text,
        totalPrice: double.tryParse(_totalPriceController.text) ?? 0.0,
        message: _messageController.text,
        coupon: _couponController.text,
      );

      UserOrderService orderService = UserOrderService(
        dio: _dio,
        baseUrl: _baseUrl,
      );

      try {
        Response response = await orderService.createOrder(
          userId: '65f3182414a9f822ca2a6067',
          authToken: 'maroTKeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
          order: order,
          language: 'en',
        );

        if (response.statusCode == 200) {
          _showAlertDialog("Order Successful".tr(),
              "Your order has been placed successfully.".tr());
          // print("okaaaay");
        } else {
          _showAlertDialog("Order Failed".tr(),
              "Failed to place the order. Please try again.".tr());
        }
      } catch (e) {
        _showAlertDialog('Error', 'An error occurred: ${e.toString()}');
      }
    }
  }

  void _showAlertDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                if (title == "Order Successful".tr()) {
                  Navigator.of(context)
                      .pop(); // Go back to the previous screen if order is successful
                }
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
      appBar: AppBarScreens(context, "Create Order".tr()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  SafeArea(
                    top: true,
                    child: Center(
                      child: Text(
                        "Please Enter Informations \n which you sign up with"
                            .tr(),
                        style: getBoldBlue14Style(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  FillInformationWidget(
                    controller: _userNameController,
                    validator: (value) {
                      if (!Validator.hasMinLength(value)) {
                        return "Enter your userName".tr();
                      }
                      return null;
                    },
                    text: "User Name".tr(),
                    width: double.infinity,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Phone Number".tr(),
                    style: getBoldBlack14Style(),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomTextFormField(
                          text: "+966",
                          width: 130.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        flex: 6,
                        child: CustomTextFormField(
                          controller: _userPhoneController,
                          inputType: TextInputType.number,
                          width: 200.w,
                          validator: (value) {
                            if (!Validator.hasMinLength(value)) {
                              return "Enter your Phone Number".tr();
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  FillInformationWidget(
                    controller: _userAddressController,
                    validator: (value) {
                      if (!Validator.hasMinLength(value)) {
                        return "Enter your Address".tr();
                      }
                      return null;
                    },
                    text: "Address".tr(),
                    width: double.infinity,
                  ),
                  SizedBox(height: 20.h),
                  FillInformationWidget(
                    controller: _userCityController,
                    validator: (value) {
                      if (!Validator.hasMinLength(value)) {
                        return "Enter your city".tr();
                      }
                      return null;
                    },
                    text: "City".tr(),
                    width: double.infinity,
                  ),
                  SizedBox(height: 20.h),
                  FillInformationWidget(
                    controller: _totalPriceController,
                    text: "Total After Discount".tr(),
                    width: double.infinity,
                  ),
                  SizedBox(height: 20.h),
                  FillInformationWidget(
                    controller: _messageController,
                    text: "Message".tr(),
                    width: double.infinity,
                  ),
                  SizedBox(height: 20.h),
                  FillInformationWidget(
                    controller: _couponController,
                    text: "Coupon".tr(),
                    width: double.infinity,
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyTheme.mainPrimaryColor4,
                      ),
                      onPressed: _submitOrder,
                      child: Text(
                        "Confirm".tr(),
                        style: getBoldWhite16Style(),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
