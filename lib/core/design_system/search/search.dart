import 'package:flutter/material.dart';
import 'package:pilar/core/design_system/design_system.dart';
import 'package:pilar/core/keys/keys.dart';

class Search extends StatefulWidget {
  final Function(String) onTap;
  const Search({Key? key, required this.onTap}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: PilarKeys.searchKey,
      width: 180,
      height: DSSizes.extraLarge,
      padding: const EdgeInsets.only(left: DSSizes.small),
      decoration: const BoxDecoration(
        color: DSColors.transparentWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(DSSizes.extraSmall),
        ),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                style: const TextStyle(
                  fontSize: DSSizes.small + DSSizes.megaSmall,
                  color: DSColors.primaryPurple,
                ),
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                ),
                cursorColor: DSColors.primaryPurple,
                onEditingComplete: () => widget.onTap.call(_controller.text),
              ),
            ),
            IconButton(
              onPressed: () => widget.onTap.call(_controller.text),
              icon: const Icon(
                Icons.search,
                color: DSColors.primaryPurple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
