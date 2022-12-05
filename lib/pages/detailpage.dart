import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:my_xpenses/shared/appbar_shared.dart';
import 'package:my_xpenses/shared/fontcolor_shared.dart';
import 'package:my_xpenses/shared/fontsize_shared.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarShared(
        height: 80,
        child: Column(
          children: [
            Text(
              "Welcome Back Zakwan!",
              style: AppText.px17.w600.customColor(whiteColor).letterSpace(2),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Balance: RM 1980.00",
              style: AppText.px15.w100.customColor(whiteColor).letterSpace(2),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 200,
          columns: const [
            DataColumn2(
              label: Text('Item'),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Text('Allocated Budget'),
            ),
            DataColumn(
              label: Text('Spend'),
            ),
            DataColumn(
              label: Text('Balance'),
            ),
          ],
          rows: List<DataRow>.generate(
            10,
            (index) => DataRow(cells: [
              DataCell(Text('A' * (10 - index % 10))),
              DataCell(Text('B' * (10 - (index + 5) % 10))),
              DataCell(Text('C' * (15 - (index + 5) % 10))),
              DataCell(Text('D' * (15 - (index + 10) % 10))),
            ]),
          ),
        ),
      ),
    );
  }
}
