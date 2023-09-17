import 'package:flutter/material.dart';
import 'package:panel_admin_pulsa/common/constants.dart';
import 'package:panel_admin_pulsa/common/state_enum.dart';
import 'package:panel_admin_pulsa/presentation/pages/transaksi/component/search_field.dart';
import 'package:panel_admin_pulsa/presentation/pages/transaksi/component/table_transaksi.dart';
import 'package:panel_admin_pulsa/presentation/provider/transaksi_notifier.dart';
import 'package:panel_admin_pulsa/presentation/widgets/my_scaffold.dart';
import 'package:provider/provider.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});
  static const ROUTE_NAME = '/transaksi';

  @override
  State<TransaksiPage> createState() => _TransaksiState();
}

class _TransaksiState extends State<TransaksiPage> {
  @override
  void initState() {
    super.initState();
    print('initState');
    Future.microtask(
      () => Provider.of<TransaksiNotifier>(context, listen: false)
          .fetchTransaksiHistory(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: TransaksiPage.ROUTE_NAME,
      title: 'Transaksi',
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(),
            SizedBox(
              height: defaultPadding,
            ),
            Consumer<TransaksiNotifier>(
              builder: (_, provider, __) {
                switch (provider.historyTransaksiState) {
                  case RequestState.Loading:
                    {
                      print('loading');
                      return const Center(child: CircularProgressIndicator());
                    }
                  // return const Center(child: CircularProgressIndicator());
                  case RequestState.Loaded:
                    return TableTransaksi(
                      data: provider.transaksiHistory,
                    );
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
