import 'package:pilar/app/features/home/domain/entities/image.dart';

typedef Properties = List<Property>;

class Property {
  String? address;
  String? propertyType;
  int? askingPrice;
  int? bedrooms;
  int? suites;
  int? parkingSpots;
  List<Image>? images;
  String? city;
  String? building;

  Property({
    this.address,
    this.propertyType,
    this.askingPrice,
    this.bedrooms,
    this.suites,
    this.parkingSpots,
    this.images,
    this.city,
    this.building,
  });
}
