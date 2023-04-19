import 'package:flutter/material.dart';
import 'package:pilar/app/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: (RouteSettings routeSettings) => routes(routeSettings));
  }
}
