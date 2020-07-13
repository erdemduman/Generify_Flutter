import 'package:flutter/material.dart';
import 'package:generify/constants/routes.dart';
import 'package:generify/service/route_service.dart';
import 'package:generify/ui/locator.dart';
import 'package:generify/ui/page/bottom_navigation_page.dart';
import 'package:generify/ui/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: generateRoute,
      initialRoute: Routes.login_page,
      navigatorKey: locator<RouteService>().routerKey,
    );
  }
}
