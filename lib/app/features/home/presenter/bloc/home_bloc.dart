import 'package:flutter/foundation.dart';
import 'package:pilar/app/features/home/domain/entities/property.dart';
import 'package:pilar/app/features/home/domain/usecase/get_properties_use_case.dart';

class HomeState {
  bool isLoading;
  List<Property>? properties;

  HomeState({this.isLoading = true, this.properties});
}

class HomeBloc extends ChangeNotifier {
  final GetPropertiesUseCase _useCase;

  HomeBloc(this._useCase);

  final currentState = ValueNotifier<HomeState>(HomeState());

  Future<void> getProperties() async {
    currentState.value.isLoading = true;
    try {
      final response = await _useCase();
      response.sort((b, a) => a.askingPrice!.compareTo(b.askingPrice!));

      currentState.value.properties = response;
      currentState.notifyListeners();
    } catch (error) {
      print(error);
    }
    currentState.value.isLoading = false;
  }

  void reOrderProperties(String? string) {
    bool orderMostExpensive = string == "MAIS CARO";
    if (orderMostExpensive) {
      currentState.value.properties
          ?.sort((b, a) => a.askingPrice!.compareTo(b.askingPrice!));

      currentState.notifyListeners();
    } else {
      currentState.value.properties
          ?.sort((a, b) => a.askingPrice!.compareTo(b.askingPrice!));
      currentState.notifyListeners();
    }
  }
}