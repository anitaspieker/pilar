import 'dart:io';

import 'package:pilar/app/features/home/data/datasource/pilar_backend.dart';
import 'package:pilar/app/features/home/data/models/property_model.dart';
import 'package:pilar/core/contracts/datasource/datasource.dart';

class GetPropertiesDataSource implements DataSource {
  @override
  Future<List<PropertyModel>?> call(
      {FromJson? fromJson, Map<String, dynamic>? param}) async {
    final response = await PilarBackend.handleRequest();

    if (response.status == HttpStatus.ok) {
      List<PropertyModel> properties = [];
      for (var json in response.json!) {
        var property = PropertyModel.fromJson(json);
        properties.add(property);
      }
      return properties;
    }

    return null;
  }
}
