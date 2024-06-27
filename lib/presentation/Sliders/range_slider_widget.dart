import 'package:flutter/material.dart';
import 'package:maro/core/theme/my_theme.dart';

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({super.key});

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  RangeValues values = const RangeValues(100, 2000);
  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      values.start.toString(),
      values.end.toString(),
    );
    return Center(
      child: RangeSlider(
        activeColor: MyTheme.mainPrimaryColor4,
          values: values,
          divisions: 10,
          min: 0,
          max: 2000,
          labels: labels,
          onChanged: (newValues) {
            setState(() {
              values = newValues;
            });
          }),
    );
  }
}
