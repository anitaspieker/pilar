// import 'package:pilar/app/features/home/data/repository/get_properties_repository_impl.dart';
// import 'package:pilar/app/features/home/domain/entities/property.dart';

// abstract class GetPropertiesUseCase {
//   Future<Properties> call();
// }

// class GetPropertiesUseCaseImpl implements GetPropertiesUseCase {
//   final GetPropertiesRepository repository;

//   GetPropertiesUseCaseImpl(this.repository);

//   @override
//   Future<Properties> call() {
//     return repository.call();
//   }
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pilar/app/features/home/data/repository/get_properties_repository_impl.dart';
import 'package:pilar/app/features/home/domain/entities/property.dart';
import 'package:pilar/app/features/home/domain/usecase/get_properties_use_case.dart';

class RepositoryMock extends Mock implements GetPropertiesRepository {}

main() {
  late GetPropertiesUseCase useCase;
  late GetPropertiesRepository repository;

  setUp(() {
    repository = RepositoryMock();
    useCase = GetPropertiesUseCaseImpl(repository);
  });


  group('Get Properties Use Case |', () {
    test('Should return a list of Properties', () async {
       when(() => repository.call())
          .thenAnswer((invocation) async => [Property(address: "abc")]);

      final list = await useCase();

      expect(list, isA<Properties>());
    });
  });
}




