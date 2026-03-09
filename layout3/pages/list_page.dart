import 'package:flutter/material.dart';
import '../models/person.dart';
import '../widgets/form_widget.dart';
import '../widgets/table_widget.dart';

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<Person> people = [
    Person(id: "01", name: "Nguyen An", age: "22", email: "an@gmail.com"),
    Person(id: "02", name: "Tran Binh", age: "25", email: "binh@gmail.com"),
  ];

  Person? selectedPerson;

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();

  void addPerson() {
    setState(() {
      people.add(
        Person(
          id: (people.length + 1).toString(),
          name: name.text,
          age: age.text,
          email: email.text,
        ),
      );
    });
  }

  void updatePerson() {
    if (selectedPerson != null) {
      setState(() {
        selectedPerson!.name = name.text;
        selectedPerson!.age = age.text;
        selectedPerson!.email = email.text;
      });
    }
  }

  void deletePerson() {
    if (selectedPerson != null) {
      setState(() {
        people.remove(selectedPerson);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("LIST MANAGEMENT SYSTEM"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TableWidget(
              people: people,
              onSelect: (p) {
                setState(() {
                  selectedPerson = p;
                  name.text = p.name;
                  age.text = p.age;
                  email.text = p.email;
                });
              },
            ),

            const SizedBox(height: 40),

            FormWidget(
              title: "CREATE ITEM",
              buttonText: "Save",
              name: name,
              age: age,
              email: email,
              onSubmit: addPerson,
            ),

            const SizedBox(height: 40),

            FormWidget(
              title: "UPDATE ITEM",
              buttonText: "Update",
              name: name,
              age: age,
              email: email,
              onSubmit: updatePerson,
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: deletePerson,
              child: const Text("Delete Selected Item"),
            ),
          ],
        ),
      ),
    );
  }
}