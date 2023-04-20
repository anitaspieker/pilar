import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pilar/app/features/home/domain/entities/response.dart';

class PilarBackend {
  static Future<Response> handleRequest({String? asset}) async {
    try {
      final response = await rootBundle.loadString(asset ?? 'assets/response.json');
      final jsonResponse = jsonDecode(response);

      return Response(status: HttpStatus.ok, json: jsonResponse);
    } catch (error) {
      return Response(status: HttpStatus.notFound);
    }
  }
}
