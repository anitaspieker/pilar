import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pilar/app/features/home/presenter/bloc/home_bloc.dart';
import 'package:pilar/core/design_system/design_system.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bloc = GetIt.I<HomeBloc>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    bloc.getProperties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<HomeState>(
        valueListenable: bloc.currentState,
        builder: (context, data, _) {
          return Scaffold(
            appBar: const PilarAppBar(),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.fitHeight,
                  opacity: .5,
                ),
              ),
              child: Column(
                children: data.isLoading || data.properties == null
                    ? [const Loader()]
                    : [
                        Container(
                          height: MediaQuery.of(context).size.height * .7,
                          padding: const EdgeInsets.all(DSSizes.medium),
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: data.properties?.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    crossAxisSpacing: DSSizes.medium,
                                    mainAxisSpacing: DSSizes.medium),
                            itemBuilder: (BuildContext ctx, index) {
                              var currentProperty = data.properties![index];
                              return PropertyCard(
                                  image: currentProperty.images?.first.url,
                                  address: currentProperty.address,
                                  type: currentProperty.propertyType,
                                  price: currentProperty.askingPrice,
                                  bedrooms: currentProperty.bedrooms,
                                  suites: currentProperty.suites,
                                  parkingSpots: currentProperty.parkingSpots);
                            },
                          ),
                        )
                      ],
              ),
            ),
          );
        });
  }
}
