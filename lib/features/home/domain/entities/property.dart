import 'package:pilar/features/home/domain/entities/image.dart';

class Property {
  String? address;
  String? propertyType;
  int? askingPrice;
  int? bedrooms;
  int? suites;
  int? parkingSpots;
  List<Image>? images;

  Property({this.address, this.propertyType, this.askingPrice, this.bedrooms, this.suites, this.parkingSpots, this.images});
}