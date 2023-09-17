import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:panel_admin_pulsa/common/constants.dart';
import 'package:panel_admin_pulsa/common/state_enum.dart';
import 'package:panel_admin_pulsa/presentation/provider/banners_notifier.dart';
import 'package:panel_admin_pulsa/presentation/widgets/my_scaffold.dart';
import 'package:provider/provider.dart';

class BannersPage extends StatefulWidget {
  const BannersPage({super.key});
  static const ROUTE_NAME = '/banners';

  @override
  State<BannersPage> createState() => _BannersPageState();
}

class _BannersPageState extends State<BannersPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<BannersNotifier>().fetchBanners());
    // Future.microtask(() => context.read<ProductListNotifier>().fetchProduct());
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: '/banners',
      title: 'Banners',
      body: Consumer<BannersNotifier>(
        builder: (context, bannersNotifier, _) {
          switch (bannersNotifier.bannersState) {
            case RequestState.Loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.Loaded:
              return GridView.builder(
                padding: kDefaultPadding,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.7,
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: defaultPadding,
                ),
                itemCount: bannersNotifier.banners.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(defaultRadius),
                      color: secondaryColor,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                          color: Colors.white,
                          child: Image(
                            isAntiAlias: true,
                            semanticLabel: 'Banner',
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                bannersNotifier.banners[index].imageUrl),
                          ),
                        ),
                        Text(
                          bannersNotifier.banners[index].description,
                          style: ThemeData().textTheme.displayLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  );
                },
              );
            default:
              return const SizedBox(
                height: 0,
              );
          }
        },
      ),
    );
  }
}
