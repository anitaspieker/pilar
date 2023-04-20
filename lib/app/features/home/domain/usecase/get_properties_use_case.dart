import 'package:pilar/app/features/home/data/repository/get_properties_repository_impl.dart';
import 'package:pilar/app/features/home/domain/entities/property.dart';

abstract class GetPropertiesUseCase {
  Future<Properties> call();
}

class GetPropertiesUseCaseImpl implements GetPropertiesUseCase {
  final GetPropertiesRepository repository;

  GetPropertiesUseCaseImpl(this.repository);

  @override
  Future<Properties> call() {
    return repository.call();
  }
}
