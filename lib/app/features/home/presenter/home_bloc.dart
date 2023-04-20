import 'package:flutter/foundation.dart';
import 'package:pilar/app/features/home/domain/entities/property.dart';
import 'package:pilar/app/features/home/domain/usecase/get_properties_use_case.dart';
import 'package:pilar/core/utils/string_normalizer.dart';

class HomeState {
  bool isLoading;
  Properties? properties;
  String orderedBy;

  HomeState({this.isLoading = true, this.properties, this.orderedBy = "MAIS CARO"});
}

class HomeBloc extends ChangeNotifier {
  final GetPropertiesUseCase _useCase;

  HomeBloc(this._useCase);

  final currentState = ValueNotifier<HomeState>(HomeState());

  Future<void>? getProperties() async {
    currentState.value.isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    try {
      final response = await _useCase();

      currentState.value.properties = response;
      reOrderProperties(currentState.value.orderedBy);
    } catch (_) {
      getProperties();
    }
    currentState.value.isLoading = false;
  }

  void reOrderProperties(String? string) {
    currentState.value.orderedBy = string ?? "MAIS CARO";
    bool orderMostExpensive = string == "MAIS CARO";
    if (orderMostExpensive) {
      currentState.value.properties?.sort((b, a) => a.askingPrice!.compareTo(b.askingPrice!));

      currentState.notifyListeners();
    } else {
      currentState.value.properties?.sort((a, b) => a.askingPrice!.compareTo(b.askingPrice!));
      currentState.notifyListeners();
    }
  }

  void search(String query) async {
    if (query.isNotEmpty) {
      var normalizedQuery = StringNormalizer.normalizeString(query);

      await getProperties()!.then((_) => currentState.value.properties = _filterThroughQuery(normalizedQuery));

      currentState.notifyListeners();
    } else {
      getProperties();
    }
  }

  Properties _filterThroughQuery(String query) {
    Properties searchResults = [];
    for (var property in currentState.value.properties!) {
      // O campo de busca deve filtrar os imóveis por endereço, cidade e nome do edifício (caso haja).
      var address = StringNormalizer.normalizeString(property.address ?? "");
      var city = StringNormalizer.normalizeString(property.city ?? "");
      var building = StringNormalizer.normalizeString(property.building ?? "");

      bool queryValidator = address.contains(query) || city.contains(query) || building.contains(query);
      if (queryValidator) {
        searchResults.add(property);
      }
    }
    return searchResults;
  }
}
