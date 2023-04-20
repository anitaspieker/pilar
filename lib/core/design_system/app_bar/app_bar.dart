import 'package:flutter/material.dart';
import 'package:pilar/core/design_system/design_system.dart';
import 'package:pilar/core/keys/keys.dart';

class PilarAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PilarAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: PilarKeys.appBarKey,
      backgroundColor: DSColors.primaryPurple,
      actions: [
        const SizedBox(width: DSSizes.small),
        Image.asset(
          "assets/logo.png",
          width: DSSizes.enormous,
        ),
        const Spacer(),
        appBarIcon(Icons.house),
        appBarIcon(Icons.handshake),
        appBarIcon(Icons.notifications),
        appBarIcon(Icons.exit_to_app),
        const SizedBox(width: DSSizes.small),
      ],
    );
  }

  Widget appBarIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DSSizes.megaSmall),
      child: Icon(
        icon,
        size: DSSizes.extraLarge,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
