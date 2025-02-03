import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/home/presentation/screens/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    final isIOS = defaultTargetPlatform == TargetPlatform.iOS;
    switch (settings.name) {
      case Routes.home:
        return _buildRoute(const HomeScreen(), isIOS);
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _buildRoute(Widget widget, bool isIOS) {
    return isIOS
        ? CupertinoPageRoute(builder: (_) => widget)
        : MaterialPageRoute(builder: (_) => widget);
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
