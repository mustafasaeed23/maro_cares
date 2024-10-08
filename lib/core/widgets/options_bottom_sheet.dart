import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';
import 'package:maro/featuers/Home/Sliders/range_slider_widget.dart';

class OptionsBottomSheet extends StatefulWidget {
  final Product product;
  final List<String> selectedFilters;
  final Function(List<String>) onFiltersSelected;

  const OptionsBottomSheet({
    super.key,
    required this.product,
    required this.selectedFilters,
    required this.onFiltersSelected,
  });

  @override
  State<OptionsBottomSheet> createState() => _OptionsBottomSheetState();
}

class _OptionsBottomSheetState extends State<OptionsBottomSheet> {
  late List<String> _selectedFilters;

  @override
  void initState() {
    super.initState();
    _selectedFilters = widget.selectedFilters;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExpansionTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.filter_alt,
                      color: MyTheme.mainPrimaryColor4,
                      size: 30,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      "Options".tr(),
                      style: getSemiBoldBlack14Style(),
                    ),
                  ],
                ),
                children: widget.product.filter!.map((filter) {
                  return CheckboxListTile(
                    title: Text(
                      filter.tr(),
                      style: getRegularBlack16Style(),
                    ),
                    value: _selectedFilters.contains(filter),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedFilters.add(filter);
                        } else {
                          _selectedFilters.remove(filter);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Price".tr(),
                style: getSemiBoldBlack14Style(),
              ),
              SizedBox(
                height: 20.h,
              ),
              const RangeSliderWidget(),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "\$0 - \$2000",
                style: getSemiBoldBlack14Style(),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 350.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyTheme.mainPrimaryColor4,
                  ),
                  onPressed: () {
                    widget.onFiltersSelected(_selectedFilters);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Active".tr(),
                    style: getBoldWhite14Style(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
