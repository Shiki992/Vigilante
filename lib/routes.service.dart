import 'package:flutter/material.dart';

class RouteService extends ChangeNotifier with RouteAware {
  final rootKey = GlobalKey<ScaffoldState>();
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> homeNavigatorKey;

  Future<dynamic> rootNavigateTo(String routeName, {dynamic arguments}) {
    return rootNavigatorKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> homeNavigateTo(String routeName, {dynamic arguments}) {
    return homeNavigatorKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  void rootGoBack() {
    return rootNavigatorKey.currentState.pop();
  }

  void homeGoBack() {
    return homeNavigatorKey.currentState.pop();
  }
}
