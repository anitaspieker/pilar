import 'package:flutter/material.dart';
import 'package:pilar/core/design_system/app_bar/app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PilarAppBar(),
      body: Image.asset(
        "assets/background.png",
        fit: BoxFit.fitHeight,
        height: MediaQuery.of(context).size.height,
        opacity: const AlwaysStoppedAnimation(.5),
      ),
    );
  }
}
