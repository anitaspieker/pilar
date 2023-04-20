import 'package:get_it/get_it.dart';
import 'package:pilar/app/features/home/data/datasource/get_properties_datasource.dart';
import 'package:pilar/app/features/home/data/repository/get_properties_repository_impl.dart';
import 'package:pilar/app/features/home/domain/usecase/get_properties_use_case.dart';
import 'package:pilar/app/features/home/presenter/home_bloc.dart';

class HomeInjector {
  call() {
    GetIt.I.registerFactory<GetPropertiesDataSource>(
        () => GetPropertiesDataSource());
    GetIt.I.registerFactory<GetPropertiesRepository>(
        () => GetPropertiesRepositoryImpl(GetIt.I<GetPropertiesDataSource>()));
    GetIt.I
        .registerFactory<GetPropertiesUseCase>(() => GetPropertiesUseCaseImpl(
              GetIt.I<GetPropertiesRepository>(),
            ));

    GetIt.I.registerFactory<HomeBloc>(() => HomeBloc(
          GetIt.I<GetPropertiesUseCase>(),
        ));
  }
}
