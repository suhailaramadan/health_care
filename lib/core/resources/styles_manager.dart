import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) =>
    TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fonFamily,
      color: color,
      fontWeight: fontWeight,
    );

TextStyle getLightStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.light,
      color,
    );

TextStyle getRegularStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s16,
      FontWeightManager.regular,
      color,
    );

TextStyle getMediumStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s18,
      FontWeightManager.medium,
      color,
    );

TextStyle getSemiBoldStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s20,
      FontWeightManager.semiBold,
      color,
    );

TextStyle getBoldStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s22,
      FontWeightManager.bold,
      color,
    );

TextStyle _getTextStyleTajawal(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) =>
    TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.font,
      color: color,
      fontWeight: fontWeight,
    );
TextStyle getTajawalBoldStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyleTajawal(
      fontSize ?? FontSize.s22,
      FontWeightManager.tajawalBold,
      color,
    );
TextStyle getExtraBoldStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyleTajawal(
      fontSize ?? FontSize.s22,
      FontWeightManager.extraBold,
      color,
    );

TextStyle getTextWithLine() => TextStyle(
      color: ColorManager.primary,
      fontSize: FontSize.s16,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.lineThrough,
      decorationColor: ColorManager.primary,
    );
