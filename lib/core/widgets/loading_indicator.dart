import 'package:flutter/material.dart';
import 'package:maro/core/theme/my_theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: MyTheme.mainColor,
      ),
    );
  }
}
