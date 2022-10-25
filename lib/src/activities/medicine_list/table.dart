import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Medicine List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
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
    );
  }
}
