import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pilar/app/features/home/data/repository/get_properties_repository_impl.dart';
import 'package:pilar/app/features/home/domain/entities/property.dart';
import 'package:pilar/core/contracts/datasource/datasource.dart';

class DataSourceMock extends Mock implements DataSource {}

main() {
  late DataSource dataSource;
  late GetPropertiesRepository repository;

  setUp(() {
    dataSource = DataSourceMock();
    repository = GetPropertiesRepositoryImpl(dataSource);
  });

  group('Get Properties Repository |', () {
    test('call should return a list Properties', () async {
      when(() => dataSource(fromJson: any(named: 'fromJson'))).thenAnswer((invocation) async => [Property(address: "abc")]);

      final list = await repository();

      expect(list, isA<Properties>());
    });
  });
}
