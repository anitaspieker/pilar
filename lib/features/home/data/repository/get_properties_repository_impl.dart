import 'package:pilar/core/base/datasource/datasource.dart';
import 'package:pilar/features/home/domain/entities/property.dart';

abstract class GetPropertiesRepository {
  Future<List<Property>> call();
}

class GetPropertiesRepositoryImpl implements GetPropertiesRepository {
  final DataSource dataSource;

  GetPropertiesRepositoryImpl(this.dataSource);
  @override
  Future<List<Property>> call() async {
    return await dataSource.call();
  }
}
