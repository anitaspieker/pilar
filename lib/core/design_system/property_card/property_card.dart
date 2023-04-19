import 'package:flutter/material.dart';
import 'package:pilar/core/design_system/design_system.dart';
import 'package:pilar/core/utils/int_to_currency.dart';

class PropertyCard extends StatelessWidget {
  final String? image;
  final String? address;
  final String? type;
  final int? price;
  final int? bedrooms;
  final int? suites;
  final int? parkingSpots;
  const PropertyCard(
      {Key? key,
      this.image,
      this.address,
      this.type,
      this.price,
      this.bedrooms,
      this.suites,
      this.parkingSpots})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.only(
        topLeft: Radius.circular(DSSizes.small),
        topRight: Radius.circular(DSSizes.small));
    return Container(
      height: 800,
      decoration: const BoxDecoration(
        color: DSColors.transparentWhite,
        borderRadius: borderRadius,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: borderRadius,
            child: Image.network(
              image ?? "",
              height: 100,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Text('Your error widget...');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DSSizes.extraSmall),
            child: Column(children: [Text(address ?? "", overflow: TextOverflow.ellipsis,),
            Text(type ?? ""),
            Text(MoneyFormat.moneyFormat(price ?? 0)),
            Text("${bedrooms}QT ${suites}ST ${parkingSpots}VG")],),
          )
          
        ],
      ),
    );
  }
}
