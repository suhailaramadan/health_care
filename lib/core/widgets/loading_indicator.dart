import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/color_manager.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 120,
      width: 100,
      decoration: BoxDecoration(
          color: ColorManager.blue, borderRadius: BorderRadius.circular(8)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: ColorManager.primary,
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Text(
            "تحميل...",
            style: TextStyle(color: ColorManager.textColor),
          ),
        ],
      ),
    );
  }
}
