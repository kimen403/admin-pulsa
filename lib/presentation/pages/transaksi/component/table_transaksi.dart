import 'package:flutter/material.dart';
import 'package:panel_admin_pulsa/common/constants.dart';
import 'package:panel_admin_pulsa/common/utils.dart';
import 'package:panel_admin_pulsa/domain/entities/transaksi.dart';

class TableTransaksi extends StatelessWidget {
  const TableTransaksi({
    super.key,
    required this.data,
  });
  final List<Transaksi> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: SingleChildScrollView(
        child: DataTable(
          columnSpacing: defaultPadding,
          columns: [
            DataColumn(
              label: Text('Tanggal'),
            ),
            DataColumn(
              label: Text('Id Transaksi'),
            ),
            DataColumn(
              label: Text('User Name'),
            ),
            DataColumn(
              label: Text('Produk'),
            ),
            DataColumn(
              label: Text('rc'),
            ),
            DataColumn(
              label: Text('Keterangan'),
            ),
            DataColumn(
              label: Text('Status'),
            ),
          ],
          rows: List.generate(
            data.length,
            (index) => DataRow(
              color: data[index].status.toLowerCase() == 'sukses'
                  ? MaterialStateProperty.all(secondaryColor)
                  : MaterialStateProperty.all(
                      const Color.fromARGB(255, 223, 1, 23),
                    ),
              cells: [
                DataCell(
                  Text(formatDateTime(data[index].tanggal)),
                ),
                DataCell(
                  Text(data[index].idTransaksi),
                ),
                DataCell(
                  Text(data[index].idUser),
                ),
                DataCell(
                  Text(data[index].sku),
                ),
                DataCell(
                  Text(data[index].rc),
                ),
                DataCell(
                  Text(data[index].keterangan),
                ),
                DataCell(
                  Text(data[index].status),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
