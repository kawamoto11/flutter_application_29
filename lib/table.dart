//表のコード
import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    Key? key,
    required this.graphtype,
  }) : super(key: key);

  final List graphtype;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green.withOpacity(0.25)),
          color: Colors.blue.withOpacity(0.25),
        ),
        child: DataTable(
          columns: const <DataColumn>[
            //上段のコード
            DataColumn(
              label: Text(
                '営業利益',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '2016',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '2017',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '2018',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '2019',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '2020',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '2021',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              //下段のコード
              cells: <DataCell>[
                const DataCell(Text('Sarah')),
                DataCell(Text(graphtype[0].toString())),
                DataCell(Text(graphtype[1].toString())),
                DataCell(Text(graphtype[2].toString())),
                DataCell(Text(graphtype[3].toString())),
                DataCell(Text(graphtype[4].toString())),
                DataCell(Text(graphtype[5].toString())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
