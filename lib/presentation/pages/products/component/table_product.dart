import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:panel_admin_pulsa/common/constants.dart';
import 'package:panel_admin_pulsa/domain/entities/product.dart';

class TableProduct extends StatefulWidget {
  const TableProduct({
    super.key,
    required this.data,
  });

  final List<Product> data;

  @override
  State<TableProduct> createState() => _TableProductState();
}

class _TableProductState extends State<TableProduct> {
  bool sorts = false;

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
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          columnSpacing: defaultPadding,
          columns: [
            DataColumn(
              label: Text('Id'),
            ),
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              tooltip: 'Sort',
              onSort: (columnIndex, sortAscending) {
                setState(() {
                  if (sorts) {
                    sorts = !sorts;
                    widget.data
                        .sort((a, b) => a.basePrice.compareTo(b.basePrice));
                  } else {
                    sorts = !sorts;
                    widget.data
                        .sort((a, b) => b.basePrice.compareTo(a.basePrice));
                  }
                });
              },
              label: Text(
                'Base Price',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            DataColumn(
              label: Text(
                'Vip Price',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            DataColumn(
              label: Text('Price'),
            ),
            DataColumn(
              label: Text('Category'),
            ),
            DataColumn(
              label: Text('Provider'),
            ),
            DataColumn(
              label: Text('Code'),
            ),
            DataColumn(
              label: Text(
                'Form Type',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            DataColumn(
              label: Text('Status'),
            ),
            DataColumn(
              label: Text('Desc'),
            ),
            DataColumn(
              label: Text('Action'),
            ),
          ],
          rows: List.generate(
            widget.data.length,
            (index) => DataRow(
              onSelectChanged: (value) {
                print('selected' + widget.data[index].id);
              },
              mouseCursor: MaterialStateMouseCursor.clickable,
              cells: [
                DataCell(
                  Text(widget.data[index].id),
                ),
                DataCell(
                  Text(widget.data[index].name,
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                ),
                DataCell(
                  Text(
                    NumberFormat.simpleCurrency(
                      decimalDigits: 0,
                      locale: 'id',
                      name: 'Rp ',
                    ).format(widget.data[index].basePrice),
                    maxLines: 1,
                  ),
                ),
                DataCell(
                  Text(
                    NumberFormat.simpleCurrency(
                      decimalDigits: 0,
                      locale: 'id',
                      name: 'Rp ',
                    ).format(
                      widget.data[index].vipPrice,
                    ),
                    maxLines: 1,
                  ),
                ),
                DataCell(
                  Text(
                    NumberFormat.simpleCurrency(
                      decimalDigits: 0,
                      locale: 'id',
                      name: 'Rp ',
                    ).format(
                      widget.data[index].price,
                    ),
                    maxLines: 1,
                  ),
                ),
                DataCell(
                  Text(widget.data[index].category),
                ),
                DataCell(
                  Text(widget.data[index].provider),
                ),
                DataCell(
                  Text(widget.data[index].code),
                ),
                DataCell(
                  Text(widget.data[index].formType),
                ),
                DataCell(
                  Text(widget.data[index].status.toString()),
                ),
                DataCell(
                  Text(
                    widget.data[index].desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          print('edit' + widget.data[index].id);
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
