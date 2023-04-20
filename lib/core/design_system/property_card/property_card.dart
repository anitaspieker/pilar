import 'package:flutter/material.dart';
import 'package:pilar/core/design_system/design_system.dart';
import 'package:pilar/core/keys/keys.dart';
import 'package:pilar/core/utils/int_to_currency.dart';

class PropertyCard extends StatelessWidget {
  final String? image;
  final String? address;
  final String? type;
  final int? price;
  final int? bedrooms;
  final int? suites;
  final int? parkingSpots;
  const PropertyCard({Key? key, this.image, this.address, this.type, this.price, this.bedrooms, this.suites, this.parkingSpots}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bedroomString = bedrooms != null ? "${bedrooms}QT" : "";
    var suitesString = bedrooms != null ? "${suites}ST" : "";
    var parkingSpotsString = bedrooms != null ? "${parkingSpots}VG" : "";
    return Container(
      key: PilarKeys.propertyCardKey,
      decoration: const BoxDecoration(
        color: DSColors.primaryPurple,
        borderRadius: BorderRadius.all(Radius.circular(DSSizes.extraSmall)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(DSSizes.extraSmall), topRight: Radius.circular(DSSizes.extraSmall)),
            child: Image.network(
              image ?? "",
              height: 100,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return const SizedBox();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DSSizes.extraSmall),
            child: Column(
              children: [
                const SizedBox(height: DSSizes.extraSmall),
                Text(
                  address ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600, color: DSColors.white),
                ),
                Text(
                  getType(type ?? ""),
                  style: const TextStyle(color: DSColors.white),
                ),
                Text(
                  MoneyFormat.moneyFormat(price ?? 0),
                  style: const TextStyle(color: DSColors.white),
                ),
                Text(
                  "$bedroomString $suitesString $parkingSpotsString",
                  style: const TextStyle(color: DSColors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

String getType(String type) {
  switch (type) {
    case "apartment":
      return "Apartamento";
    case "house":
      return "Casa";
    case "land":
      return "Terreno";
    case "penthouse":
      return "Cobertura";
    default:
      return "Apartamento";
  }
}
