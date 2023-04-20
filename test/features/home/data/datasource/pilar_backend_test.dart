import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pilar/app/features/home/data/datasource/pilar_backend.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {});
  group('Pilar Backend | handleRequest success', () {
    test('returns status 200.', () async {
      final response = await PilarBackend.handleRequest();

      expect(response.status, HttpStatus.ok);
    });

    test('returns a json list', () async {
      final response = await PilarBackend.handleRequest();

      expect(response.json is List, true);
      expect(response.json?.first is Map, true);
    });
  });

  group('Pilar Backend | handleRequest failure', () {
    test('returns status 404.', () async {
      final response = await PilarBackend.handleRequest(asset: "");

      expect(response.status, HttpStatus.notFound);
    });
  });
}