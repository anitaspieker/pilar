import 'package:flutter_test/flutter_test.dart';
import 'package:pilar/app/features/home/domain/entities/property.dart';
import 'package:pilar/app/features/home/domain/usecase/get_properties_use_case.dart';
import 'package:pilar/app/features/home/presenter/home_bloc.dart';

class MockGetPropertiesUseCase extends GetPropertiesUseCase {
  @override
  Future<Properties> call() async {
    return [
      Property(address: "1", askingPrice: 200000),
      Property(address: "2", askingPrice: 300000),
      Property(address: "3", askingPrice: 100000, city: "abc"),
    ];
  }
}

void main() {
  late HomeBloc bloc;
  late MockGetPropertiesUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetPropertiesUseCase();
    bloc = HomeBloc(mockUseCase);
  });

  group('Home Bloc |', () {
    test('Initial state is correct', () {
      expect(bloc.currentState.value.isLoading, true);
      expect(bloc.currentState.value.properties, null);
      expect(bloc.currentState.value.orderedBy, "MAIS CARO");
    });

    test('getProperties should update state with loaded properties', () async {
      await bloc.getProperties();
      expect(bloc.currentState.value.isLoading, false);
      expect(bloc.currentState.value.properties!.length, 3);
      expect(bloc.currentState.value.properties![0].address, "2");
      expect(bloc.currentState.value.properties![1].address, "1");
      expect(bloc.currentState.value.properties![2].address, "3");
    });

    test('reOrderProperties should update state with ordered properties', () async {
      await bloc.getProperties();
      bloc.reOrderProperties("MAIS BARATO");
      expect(bloc.currentState.value.orderedBy, "MAIS BARATO");
      expect(bloc.currentState.value.properties![0].address, "3");
      expect(bloc.currentState.value.properties![1].address, "1");
      expect(bloc.currentState.value.properties![2].address, "2");
    });
  });
}
