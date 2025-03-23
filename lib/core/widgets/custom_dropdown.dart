import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.collageList,
    required this.onChange,
  });
  final List<String> collageList;
  final Function(String?) onChange;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedCollege;
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: DropdownButtonFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "يجب إدخال الكلية";
                }
                return null;
              },
              value: selectedCollege,
              isExpanded: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorManager.transparent,
                focusColor: ColorManager.primary,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 214, 213, 213)
                        // color: Color.fromARGB(102, 0, 0, 0), width: 1.5
                        )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                        color: ColorManager.primary, width: 1.5)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide:
                      const BorderSide(color: ColorManager.red, width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide:
                      const BorderSide(color: ColorManager.red, width: 1.5),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 214, 213, 213))),
                hintText: "اختر الكلية",
                hintStyle: getMediumStyle(
                    color: ColorManager.grey, fontSize: FontSize.s16),
              ),
              focusColor: ColorManager.primary,
              items: widget.collageList.map((college) {
                return DropdownMenuItem(
                  alignment: Alignment.centerRight,
                  value: college,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        if (isOpen)
                          Icon(selectedCollege == college
                              ? Icons.check_circle_outline_sharp
                              : Icons.circle_outlined),
                        const SizedBox(width: 10),
                        Text(
                          college,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            // color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onTap: () {
                setState(() {
                  isOpen = true;
                });
              },
              onChanged: (value) {
                setState(() {
                  selectedCollege = value!;
                  isOpen = false;
                });
                widget.onChange(value);
              })
          //  CustomDropdown<String>(
          //     hintText: "اختر الكلية",
          //     // closedHeaderPadding: EdgeInsets.all(10),
          //     decoration: CustomDropdownDecoration(
          //       closedFillColor: Colors.transparent,
          //       closedBorder: const Border(
          //           top: BorderSide(width: 1, color: ColorManager.grey),
          //           bottom: BorderSide(width: 1, color: ColorManager.grey),
          //           left: BorderSide(width: 1, color: ColorManager.grey),
          //           right: BorderSide(width: 1, color: ColorManager.grey)),
          //       closedBorderRadius: BorderRadius.circular(Sizes.s8),
          //       // listItemDecoration:
          //     ),
          // initialItem: "اختر الكلية",
          // items: collageList,
          // onChanged: (value) {}),
          ),
    );
  }
}
