import 'package:pilar/app/features/home/domain/entities/image.dart';
import 'package:pilar/core/contracts/model/model.dart';

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
