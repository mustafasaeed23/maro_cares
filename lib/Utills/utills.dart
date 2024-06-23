import 'package:flutter/material.dart';
import 'package:maro/presentation/widgets/options_bottom_sheet.dart';

void showOptions (context){
  showModalBottomSheet(
    context: context, 
    builder: (context) => const OptionsBottomSheet() );
}