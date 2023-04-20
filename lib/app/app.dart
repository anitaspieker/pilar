import 'package:flutter/material.dart';
import 'package:pilar/app/routes/routes.dart';
import 'package:pilar/core/keys/keys.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(key: PilarKeys.materialAppKey, onGenerateRoute: (RouteSettings routeSettings) => routes(routeSettings));
  }
}
