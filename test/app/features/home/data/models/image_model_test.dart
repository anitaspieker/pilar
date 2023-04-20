import 'package:flutter_test/flutter_test.dart';
import 'package:pilar/app/features/home/data/models/image_model.dart';

main() {
  late Map<String, dynamic> json;
  late ImageModel model;

  setUp(() {
    json = {"url": "abc", "watermark_url": "abc"};
  });

  group('Image Model |', () {
    test('should parse json.', () async {
      model = ImageModel.fromJson(json);
      expect(model, isA<ImageModel>());
    });

    test("url should be abc.", () async {
      model = ImageModel.fromJson(json);
      expect(model.url, "abc");
    });
  });
}
