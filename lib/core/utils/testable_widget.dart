import 'package:flutter/material.dart';

class TestableWidget {
  static Widget createWidgetForTesting(Widget child) {
    return MaterialApp(
      home: child,
    );
  }
}
