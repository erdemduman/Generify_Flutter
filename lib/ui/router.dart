import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generify/constants/routes.dart';
import 'package:generify/ui/page/auth_webview_page.dart';
import 'package:generify/ui/page/bottom_navigation_page.dart';
import 'package:generify/ui/page/login_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case Routes.login_page:
      return MaterialPageRoute(builder: (context) => LoginPage(args));
    case Routes.bottom_navigation_page:
      return MaterialPageRoute(
          builder: (context) => BottomNavigationPage(args));
    case Routes.auth_page:
      return MaterialPageRoute(builder: (context) => AuthWebViewPage(args));
    default:
      return MaterialPageRoute(builder: (context) {
        return Container(
          child: Center(
            child: Text("There is no such route :("),
          ),
        );
      });
  }
}
