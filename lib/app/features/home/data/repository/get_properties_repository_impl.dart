import 'package:pilar/app/features/home/domain/entities/property.dart';
import 'package:pilar/core/contracts/datasource/datasource.dart';

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
