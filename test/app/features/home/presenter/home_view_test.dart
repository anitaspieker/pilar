import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pilar/app/dependency_injection/injector.dart';
import 'package:pilar/app/features/home/domain/entities/property.dart';
import 'package:pilar/app/features/home/presenter/home_bloc.dart';
import 'package:pilar/app/features/home/presenter/home_view.dart';
import 'package:pilar/core/design_system/search/search.dart';
import 'package:pilar/core/keys/keys.dart';
import 'package:pilar/core/utils/testable_widget.dart';

class BlocMock extends Mock implements HomeBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late HomeBloc bloc;

  bool firstRun = true;

  setUp(() {
    bloc = BlocMock();

    if (firstRun) {
      Injector()();
      firstRun = false;
    }
  });

  group('Home View |', () {
    testWidgets('exists', (tester) async {
      await tester.pumpWidget(TestableWidget.createWidgetForTesting(const HomeView()));

      final titleFinder = find.byKey(PilarKeys.homeViewKey);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('has AppBar', (tester) async {
      await tester.pumpWidget(TestableWidget.createWidgetForTesting(const HomeView()));

      final titleFinder = find.byKey(PilarKeys.appBarKey);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('begins showing loader', (tester) async {
      await tester.pumpWidget(TestableWidget.createWidgetForTesting(const HomeView()));

      final titleFinder = find.byKey(PilarKeys.loaderKey);
      expect(titleFinder, findsOneWidget);
    });
  });
}
