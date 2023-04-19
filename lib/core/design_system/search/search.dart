import 'package:flutter/material.dart';
import 'package:pilar/core/design_system/design_system.dart';

class Search extends StatelessWidget {
  final Function()? onTap;
  const Search({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: DSSizes.extraLarge,
        padding: const EdgeInsets.only(right: DSSizes.extraSmall),
        decoration: const BoxDecoration(
          color: DSColors.transparentWhite,
          borderRadius: BorderRadius.all(
            Radius.circular(DSSizes.extraSmall),
          ),
        ),
        child: const Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.search,
            color: DSColors.primaryPurple,
          ),
        ),
      ),
    );
  }
}
