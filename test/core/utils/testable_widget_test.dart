import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pilar/core/utils/testable_widget.dart';


void main() {
  testWidgets('TestableWidget | should create a Material App with the given child',
      (WidgetTester tester) async {
    final testChild = Container(); // The widget to test

    await tester.pumpWidget(TestableWidget.createWidgetForTesting(testChild));

    // Verify that the MaterialApp widget is created
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verify that the MaterialApp widget has the given child
    expect(find.byWidget(testChild), findsOneWidget);
  });
}
