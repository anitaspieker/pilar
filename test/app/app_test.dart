import 'package:flutter_test/flutter_test.dart';
import 'package:pilar/app/app.dart';
import 'package:pilar/app/dependency_injection/injector.dart';
import 'package:pilar/core/keys/keys.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Injector()();
  });

  testWidgets('App | exists', (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(const App());

      expect(find.byKey(PilarKeys.materialAppKey), findsOneWidget);
    });
  });
}
