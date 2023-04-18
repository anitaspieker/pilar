import 'package:pilar/core/base/model/model.dart';
import 'package:pilar/features/home/domain/entities/image.dart';

class ImageModel extends Image implements Model {
  ImageModel(String? url) : super(url);

  @override
  factory ImageModel.fromJson(Map json) {
    return ImageModel(json['url']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {'url': url};
  }
}
