import 'package:flutter/material.dart';
import 'package:pilar/core/design_system/design_system.dart';
import 'package:pilar/core/keys/keys.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        key: PilarKeys.loaderKey,
        child: Container(
            height: DSSizes.gigantic,
            width: DSSizes.gigantic,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              color: DSColors.primaryPurple,
              strokeWidth: DSSizes.extraSmall,
            )));
  }
}
