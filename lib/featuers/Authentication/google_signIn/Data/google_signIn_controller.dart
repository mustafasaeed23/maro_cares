import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maro/core/constence/Strings.dart';
import 'package:maro/featuers/Authentication/google_signIn/Data/google_signIn_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleSigninController {
  final SignInGoogleApi _signInGoogleApi = SignInGoogleApi();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle(BuildContext context) async {
    // sign in

    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // get ID Token
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String? idToken = googleAuth.idToken;

      // send to token to class api Signin
      if (idToken != null) {
        final responseData = await _signInGoogleApi.authenticateGoogle(idToken);

        String? sessionToken = responseData['token'];
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString('sessionToken', sessionToken ?? "");

        Navigator.of(context).pushNamed(home);
      } else {
        // _showErrorDialog(context, 'Failed to obtain Google ID token.');
        Navigator.of(context).pushNamed(home);

      }
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
