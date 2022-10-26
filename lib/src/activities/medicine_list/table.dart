import 'package:flutter/material.dart';

class MedicineList extends StatelessWidget {
  static const path = '/table';
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Medicine List")),
        body: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text(
                  'Patient ID',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Medicine Names',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Timing',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('RO187')),
                DataCell(Text('Ativan')),
                DataCell(Text('Morning')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('RO144')),
                DataCell(Text('Oxazepam')),
                DataCell(Text('Afternoon')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('RO987')),
                DataCell(Text('Donezpil')),
                DataCell(Text('Night')),
              ],
            ),
          ],
        ));
  }
}
