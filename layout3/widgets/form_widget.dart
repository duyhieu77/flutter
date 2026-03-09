import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final String title;
  final String buttonText;

  final TextEditingController name;
  final TextEditingController age;
  final TextEditingController email;

  final VoidCallback onSubmit;

  const FormWidget({
    super.key,
    required this.title,
    required this.buttonText,
    required this.name,
    required this.age,
    required this.email,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          Text(title),

          const SizedBox(height: 20),

          TextField(
            controller: name,
            decoration: const InputDecoration(labelText: "Name"),
          ),

          TextField(
            controller: age,
            decoration: const InputDecoration(labelText: "Age"),
          ),

          TextField(
            controller: email,
            decoration: const InputDecoration(labelText: "Email"),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ElevatedButton(
                onPressed: onSubmit,
                child: Text(buttonText),
              ),

              const SizedBox(width: 20),

              ElevatedButton(
                onPressed: () {
                  name.clear();
                  age.clear();
                  email.clear();
                },
                child: const Text("Cancel"),
              ),
            ],
          )
        ],
      ),
    );
  }
}