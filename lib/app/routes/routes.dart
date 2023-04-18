import 'package:flutter/material.dart';
import 'package:pilar/app/features/home/presenter/home_view.dart';

Widget initialPage(RouteSettings routeSettings) {
  return const HomeView();
}

Widget getPage(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case '/':
      return initialPage(routeSettings);

    default:
      return const HomeView();
  }
}

Route<dynamic> routes(RouteSettings routeSettings) {
  Widget page = getPage(routeSettings);

  return MaterialPageRoute(
      settings: routeSettings,
      builder: (BuildContext context) {
        return page;
      });
}
