import 'package:flutter/material.dart';
import 'UI_Pages/Splash.dart';

class Routes {
  Routes._();

  static const root = '/';

  static MaterialPageRoute generateRoute(RouteSettings routeSettings,
      {Widget root}) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) =>
          _buildPage(routeSettings.name, routeSettings.arguments, root),
    );
  }

  static Widget _buildPage(String name, Object arguments, Widget newRoot) {
    switch (name) {
      case root:
        return newRoot ?? Splash();
      default:
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Page not Found'),
          ),
          body: Image(image: AssetImage('Assets/Images/404')),
        ); // TODO: CREATE NOT FOUND PAGE
    }
  }
}
