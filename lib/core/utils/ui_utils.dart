import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';

class UIUtils {
  static void showLoading(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
          canPop: false,
          child: AlertDialog(
              content: SizedBox(
            height: MediaQuery.sizeOf(context).height * .2,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [LoadingIndicator()],
            ),
          ))));
  static void hideLoading(BuildContext context) => Navigator.of(context).pop();
  static void showMessage(String message) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
      );
}
