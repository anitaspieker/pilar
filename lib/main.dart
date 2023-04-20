import 'package:flutter/material.dart';
import 'package:pilar/app/app.dart';
import 'package:pilar/app/dependency_injection/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Injector()();

  runApp(const App());
}
