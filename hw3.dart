import 'package:flutter/material.dart';

void main() {
  runApp(const PhoneBookApp());
}

class PhoneBookApp extends StatelessWidget {
  const PhoneBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneBookPage(),
    );
  }
}

class Contact {
  final String name;
  final String phone;

  Contact(this.name, this.phone);
}

class PhoneBookPage extends StatefulWidget {
  const PhoneBookPage({super.key});

  @override
  State<PhoneBookPage> createState() => _PhoneBookPageState();
}

class _PhoneBookPageState extends State<PhoneBookPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Contact> _contacts = [
    Contact('Nguyễn Văn A', '0901 234 567'),
    Contact('Trần Thị B', '0912 345 678'),
    Contact('Lê Văn C', '0987 654 321'),
    Contact('Phạm Thị D', '0933 112 233'),
  ];

  List<Contact> _filteredContacts = [];

  @override
  void initState() {
    super.initState();
    _filteredContacts = List.from(_contacts);
    _searchController.addListener(_onSearch);
  }

  void _onSearch() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredContacts = _contacts.where((c) {
        return c.name.toLowerCase().contains(query) ||
            c.phone.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 420,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'DANH BẠ ĐIỆN THOẠI',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Tìm kiếm...',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: _filteredContacts.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final c = _filteredContacts[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}. ${c.name}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            c.phone,
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
