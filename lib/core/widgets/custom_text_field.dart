import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.label,
    this.hint,
    this.isObscured = false,
    this.iconData,
    this.textInputType = TextInputType.text,
    this.backgroundColor,
    this.hintTextStyle,
    this.labelTextStyle,
    this.cursorColor,
    this.readOnly = false,
    this.validation,
    this.onTap,
    this.maxLines,
    this.prefixIcon,
    this.borderBackgroundColor,
    this.suffixIcon,
  });
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final bool isObscured;
  final String? label;
  final String? hint;
  final TextInputType textInputType;
  final IconData? iconData;
  final Color? backgroundColor;
  final Color? borderBackgroundColor;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final Color? cursorColor;
  final bool readOnly;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validation;
  final void Function()? onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool hidden = widget.isObscured;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Padding(
                padding: EdgeInsets.only(top: Insets.s2),
                child: Text(widget.label!,
                    style: widget.labelTextStyle ??
                        getMediumStyle(color: ColorManager.primary)
                    // Color.fromARGB(223, 26, 114, 141))
                    //     .copyWith(fontSize: FontSize.s18),
                    // color: const Color.fromARGB(255, 16, 104, 200))
                    ),
              )
            : const SizedBox(),
        Container(
          margin: EdgeInsets.only(top: Insets.s5.h),
          decoration: BoxDecoration(
            // color: widget.backgroundColor ??
            //     ColorManager.greyDark.withOpacity(.15),
            borderRadius: BorderRadius.circular(Sizes.s8),
            border: Border.all(
              color: widget.borderBackgroundColor ?? ColorManager.transparent,
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: TextFormField(
            maxLines: widget.maxLines ?? 1,
            controller: widget.controller,
            focusNode: widget.focusNode,
            readOnly: widget.readOnly,
            style: getMediumStyle(color: ColorManager.black)
                .copyWith(fontSize: FontSize.s18),
            obscureText: hidden,
            keyboardType: widget.textInputType,
            obscuringCharacter: '*',
            cursorColor: widget.cursorColor ?? ColorManager.black,
            onTap: widget.onTap,
            onEditingComplete: () {
              widget.focusNode?.unfocus();
              if (widget.nextFocus != null) {
                FocusScope.of(context).requestFocus(widget.nextFocus);
              }
            },
            textInputAction: widget.nextFocus == null
                ? TextInputAction.done
                : TextInputAction.next,
            validator: (value) {
              if (widget.validation == null) {
                setState(() => errorText = null);
              } else {
                setState(() => errorText = widget.validation!(value));
              }
              return errorText;
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.primary)),
              contentPadding: EdgeInsets.all(Insets.s12.sp),
              hintText: widget.hint,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isObscured
                  ? IconButton(
                      onPressed: () => setState(() => hidden = !hidden),
                      iconSize: Sizes.s24.sp,
                      splashRadius: Sizes.s1,
                      isSelected: !hidden,
                      color: widget.cursorColor,
                      selectedIcon: const Icon(
                        Icons.remove_red_eye_rounded,
                        color: ColorManager.primary,
                      ),
                      icon: Icon(
                        Icons.visibility_off,
                        color: ColorManager.primary,
                      )
                      // SvgPicture.asset(SvgAssets.visibilityOff),
                      )
                  : widget.suffixIcon,
              hintStyle: widget.hintTextStyle ??
                  getRegularStyle(color: ColorManager.grey)
                      .copyWith(fontSize: 18.sp),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: ColorManager.red)),
              // enabledBorder: InputBorder.none,
              errorStyle: TextStyle(
                fontSize: FontSize.s0,
                // color: ColorManager.transparent,
              ),
            ),
          ),
        ),
        errorText == null
            ? const SizedBox()
            : Padding(
                padding: EdgeInsetsDirectional.only(
                  top: Insets.s8.h,
                  start: Insets.s8.w,
                ),
                child: Text(
                  errorText!,
                  style: getMediumStyle(color: ColorManager.red)
                      .copyWith(fontSize: 18.sp),
                ),
              ),
      ],
    );
  }
}
