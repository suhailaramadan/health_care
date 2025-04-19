import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';

class UIUtils {
  static void showLoading(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
          canPop: false,
          child: AlertDialog(
              backgroundColor: ColorManager.blue,
              content: SizedBox(
                height: MediaQuery.sizeOf(context).height * .12,
                width: MediaQuery.sizeOf(context).height * .12,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: ColorManager.primary,
                    )
                  ],
                ),
              ))));
  static void hideLoading(BuildContext context) => Navigator.of(context).pop();
  // static void showMessage(String message) => Fluttertoast.showToast(
  //       backgroundColor: ColorManager.red,
  //       msg: message,
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  static void showMessage(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            message,
            style: getRegularStyle(color: ColorManager.white),
          ),
        ),
        backgroundColor: color));
  }
}
