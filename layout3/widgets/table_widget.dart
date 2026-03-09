import 'package:flutter/material.dart';
import '../models/person.dart';

class TableWidget extends StatelessWidget {
  final List<Person> people;
  final Function(Person) onSelect;

  const TableWidget({
    super.key,
    required this.people,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      border: TableBorder.all(),
      columns: const [
        DataColumn(label: Text("ID")),
        DataColumn(label: Text("Name")),
        DataColumn(label: Text("Age")),
        DataColumn(label: Text("Email")),
      ],
      rows: people.map((p) {
        return DataRow(
          onSelectChanged: (value) {
            onSelect(p);
          },
          cells: [
            DataCell(Text(p.id)),
            DataCell(Text(p.name)),
            DataCell(Text(p.age)),
            DataCell(Text(p.email)),
          ],
        );
      }).toList(),
    );
  }
}