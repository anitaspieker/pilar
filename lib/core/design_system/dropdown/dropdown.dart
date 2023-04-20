import 'package:flutter/material.dart';
import 'package:pilar/core/design_system/design_system.dart';
import 'package:pilar/core/keys/keys.dart';

class Dropdown extends StatefulWidget {
  final void Function(String?)? onChanged;

  const Dropdown({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  List<String> menuItems = ["MAIS CARO", "MAIS BARATO"];
  String selectedValue = "MAIS CARO";

  @override
  Widget build(BuildContext context) {
    return Container(
      key: PilarKeys.dropDownKey,
      width: MediaQuery.of(context).size.width / 2 - DSSizes.extraLarge,
      height: DSSizes.extraLarge,
      decoration: const BoxDecoration(
        color: DSColors.transparentWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(DSSizes.extraSmall),
        ),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: DropdownButton(
          value: selectedValue,
          items: menuItems.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue.toString();
            });
            widget.onChanged?.call(newValue.toString());
          },
          dropdownColor: DSColors.transparentWhite,
          style: const TextStyle(fontSize: DSSizes.small + DSSizes.megaSmall, color: DSColors.primaryPurple),
        ),
      ),
    );
  }
}
