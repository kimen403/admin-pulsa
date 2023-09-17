import 'package:flutter/material.dart';
import 'package:panel_admin_pulsa/common/constants.dart';
import 'package:panel_admin_pulsa/common/state_enum.dart';
import 'package:panel_admin_pulsa/presentation/pages/products/component/table_product.dart';
import 'package:panel_admin_pulsa/presentation/provider/product_notifier.dart';
import 'package:panel_admin_pulsa/presentation/widgets/my_scaffold.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  static const String ROUTE_NAME = '/all-products';
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<ProductNotifier>(context, listen: false)
        .fecthProductsList());
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: ProductsPage.ROUTE_NAME,
      title: 'All Products',
      body: Container(
        width: double.infinity,
        margin: kDefaultMargin,
        padding: kDefaultPadding,
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('All Products'),
            Consumer<ProductNotifier>(
              builder: (context, provider, child) {
                switch (provider.listProductsState) {
                  case RequestState.Loading:
                    return const Center(child: CircularProgressIndicator());
                  case RequestState.Loaded:
                    return TableProduct(
                      data: provider.listProducts,
                    );
                  case RequestState.Error:
                    return const Center(child: Text('Error'));
                  default:
                    return const Center(child: Text(''));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
