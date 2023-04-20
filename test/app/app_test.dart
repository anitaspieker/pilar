import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pilar/app/app.dart';
import 'package:pilar/app/dependency_injection/injector.dart';
import 'package:pilar/core/keys/keys.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    Injector()();
  });

  testWidgets('App | exists', (tester) async {
    await tester.pumpWidget(const App());

    final titleFinder = find.byKey(PilarKeys.materialAppKey);
    expect(titleFinder, findsOneWidget);
  });
}
