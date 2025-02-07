import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key, this.collageList});
  final List<String>? collageList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 175,
      height: 54,
      // width: MediaQuery.of(context).size.width * .45,

      child: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomDropdown<String>(
            hintText: "اختر الكلية",
            // closedHeaderPadding: EdgeInsets.all(10),
            decoration: CustomDropdownDecoration(
              closedFillColor: Colors.transparent,
              closedBorder: const Border(
                  top: BorderSide(width: 1, color: ColorManager.grey),
                  bottom: BorderSide(width: 1, color: ColorManager.grey),
                  left: BorderSide(width: 1, color: ColorManager.grey),
                  right: BorderSide(width: 1, color: ColorManager.grey)),
              closedBorderRadius: BorderRadius.circular(Sizes.s8),
              // listItemDecoration:
            ),
            // initialItem: "اختر الكلية",
            items: collageList,
            onChanged: (value) {}),
      ),
    );
  }
}
