import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:panel_admin_pulsa/common/constants.dart';

import 'package:panel_admin_pulsa/presentation/widgets/my_scaffold.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Dashboard',
      route: '/',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BoxDashBoardStatus(
                  title: 'Sukses Transactions',
                  color: kMikadoYellow,
                  data: 570,
                ),
                BoxDashBoardStatus(
                  title: 'Pending Transactions',
                  color: Colors.yellowAccent,
                  data: 51,
                ),
                BoxDashBoardStatus(
                  title: 'Failed Transactions',
                  color: Colors.redAccent,
                  data: 5,
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BoxDashBoardStatus(
                  title: 'Pendapatan Bulan ini:',
                  color: kMikadoYellow,
                  data: NumberFormat.currency(
                    locale: 'id',
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ).format(5000000),
                ),
                BoxDashBoardStatus(
                  title: 'Total Users',
                  color: kMikadoYellow,
                  data: 51,
                ),
                BoxDashBoardStatus(
                  title: 'Nilai Rata-Rata Transaksi',
                  color: Colors.yellowAccent,
                  data: NumberFormat.currency(
                    locale: 'id',
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ).format(45901),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BoxDashBoardStatus extends StatelessWidget {
  const BoxDashBoardStatus({
    super.key,
    required this.title,
    required this.color,
    required this.data,
  });
  final String title;
  final Color color;
  final data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kDefaultPadding,
      width: 300,
      height: 110,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kHeading6.copyWith(color: secondaryColor),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            data.toString(),
            style: kHeading6.copyWith(color: secondaryColor),
          ),
        ],
      ),
    );
  }
}
