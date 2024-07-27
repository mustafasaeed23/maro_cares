import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maro/core/constence/Strings.dart';

import 'package:maro/core/widgets/options_bottom_sheet.dart';

void showOptions (context){
  showModalBottomSheet(
    context: context, 
    builder: (context) => const OptionsBottomSheet() );
}

void showSuccessDialogRegister(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Registration Successful".tr()),
        // content: Text("You have successfully registered. Please check your email for further instructions.".tr()),
        actions: <Widget>[
          TextButton(
            child: Text("OK".tr()),
            onPressed: () {
              Navigator.of(context).pushNamed(home); 
            },
          ),
        ],
      );
    },
  );
}

void showSuccessDialogLogin(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Login successful!'),
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

  void showErrorDialogLogin(String message, BuildContext context) {
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



