import 'dart:io';

import 'package:pilar/app/features/home/domain/entities/response.dart';
import 'package:pilar/core/utils/json_reader.dart';

class PilarBackend {
  static Future<Response> handleRequest() async {
    try {
      final response = await JsonReader.readJsonFile("assets/response.json");
      return Response(
          status: HttpStatus.ok,
          json: (response as List<Map<String, dynamic>>));
    } catch (_) {
      return Response(status: HttpStatus.notFound);
    }
  }
}
