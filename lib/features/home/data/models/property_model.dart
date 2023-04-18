import 'package:pilar/core/base/model/model.dart';
import 'package:pilar/features/home/data/models/image_model.dart';
import 'package:pilar/features/home/domain/entities/property.dart';

class PropertyModel extends Property implements Model {
  PropertyModel(
      {String? address,
      String? propertyType,
      int? askingPrice,
      int? bedrooms,
      int? suites,
      int? parkingSpots,
      List<ImageModel>? images})
      : super(
            address: address,
            propertyType: propertyType,
            askingPrice: askingPrice,
            bedrooms: bedrooms,
            suites: suites,
            parkingSpots: parkingSpots,
            images: images);

  @override
  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    List<ImageModel>? images;
    if (json['images'] != null) {
      images = <ImageModel>[];
      json['images'].forEach((v) {
        images!.add(ImageModel.fromJson(v));
      });
    }

    return PropertyModel(
      address: json['address'],
      propertyType: json['property_type'],
      askingPrice: json['asking_price'],
      bedrooms: json['bedrooms'],
      suites: json['suites'],
      parkingSpots: json['parking_spots'],
      images: images,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    data['address'] = address;
    data['property_type'] = propertyType;
    data['asking_price'] = askingPrice;
    data['bedrooms'] = bedrooms;
    data['suites'] = suites;
    data['parking_spots'] = parkingSpots;

    if (images != null) {
      data['images'] = images!.map((v) => (v as ImageModel).toMap()).toList();
    }
    return data;
  }
}
