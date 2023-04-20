import 'package:flutter_test/flutter_test.dart';
import 'package:pilar/app/features/home/data/datasource/get_properties_datasource.dart';
import 'package:pilar/app/features/home/data/models/property_model.dart';
import 'package:pilar/app/features/home/domain/entities/property.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GetPropertiesDataSource dataSource;

  setUp(() async {
    dataSource = GetPropertiesDataSource();
  });
  
  group('Get Properties Data Source |', () {
    test('returns a list of properties.', () async {
      final response = await dataSource(fromJson: (json) => PropertyModel.fromJson(json));

      expect(response is Properties, true);
    });

    test('first return in the list has an address - Avenida Brigadeiro Faria Lima.', () async {
      final response = await dataSource(fromJson: (json) => PropertyModel.fromJson(json));

      expect(response?.first.address, "Avenida Brigadeiro Faria Lima");
    });
  });
}