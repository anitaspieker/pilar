import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pilar/app/features/home/domain/entities/image.dart' as image;
import 'package:pilar/app/features/home/domain/entities/property.dart';
import 'package:pilar/app/features/home/presenter/home_bloc.dart';
import 'package:pilar/app/features/home/presenter/home_view.dart';
import 'package:pilar/core/keys/keys.dart';
import 'package:pilar/core/utils/testable_widget.dart';

class MockHomeBloc extends Mock implements HomeBloc {}

void main() {
  group('Home View |', () {
    late HomeBloc mockBloc;

    setUp(() {
      mockBloc = MockHomeBloc();
      GetIt.instance.registerSingleton<HomeBloc>(mockBloc);
    });

    tearDown(() {
      mockBloc.dispose();
      GetIt.instance.unregister<HomeBloc>();
    });

    testWidgets('should display loader when data is loading', (WidgetTester tester) async {
      when(() => mockBloc.currentState).thenAnswer((_) => ValueNotifier(HomeState(isLoading: true)));
      await tester.pumpWidget(TestableWidget.createWidgetForTesting(const HomeView()));
      expect(find.byKey(PilarKeys.loaderKey), findsOneWidget);
    });

    testWidgets('should display properties when data is loaded', (WidgetTester tester) async {
      final property = Property(images: [image.Image("https://docs.flutter.dev/assets/images/dash/dash-fainting.gif")], address: '123 Main St', propertyType: 'House', askingPrice: 200000, bedrooms: 3, suites: 1, parkingSpots: 2);
      when(() => mockBloc.currentState).thenAnswer((_) => ValueNotifier(HomeState(isLoading: false, properties: [property, property])));
      await tester.pumpWidget(TestableWidget.createWidgetForTesting(const HomeView()));

      expect(find.byKey(PilarKeys.loaderKey), findsNothing);
      expect(find.byKey(PilarKeys.appBarKey), findsOneWidget);
      expect(find.byKey(PilarKeys.searchKey), findsOneWidget);
      expect(find.byKey(PilarKeys.dropDownKey), findsOneWidget);
      expect(find.byKey(PilarKeys.propertyCardKey), findsWidgets);
    });
  });
}
