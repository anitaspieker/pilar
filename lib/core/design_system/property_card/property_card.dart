import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final String? image;
  const PropertyCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          image ?? "",
          height: 100,
          width: 100,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Text('Your error widget...');
          },
        ),
      ],
    );
  }
}
