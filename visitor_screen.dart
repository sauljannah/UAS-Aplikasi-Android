import 'package:flutter/material.dart';

class VisitorScreen extends StatefulWidget {
  const VisitorScreen({super.key});

  @override
  State<VisitorScreen> createState() => _VisitorScreenState();
}

class _VisitorScreenState extends State<VisitorScreen> {
  final List<Map<String, String>> visitors = [];
  final nameController = TextEditingController();
  final purposeController = TextEditingController();

  void addVisitor() {
    if (nameController.text.isEmpty || purposeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama dan Keperluan tidak boleh kosong')),
      );
      return;
    }

    setState(() {
      visitors.add({
        'name': nameController.text,
        'purpose': purposeController.text,
      });
      print('Jumlah pengunjung setelah penambahan: ${visitors.length}');
    });

    nameController.clear();
    purposeController.clear();
    Navigator.pop(context); // Menutup dialog setelah menambah pengunjung
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              print('Current Visitors: $visitors');
            },
          ),
        ],
        title: const Text('Daftar Pengunjung'),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        itemCount: visitors.length, // Pastikan jumlah pengunjung benar
        itemBuilder: (context, index) {
          print('Jumlah pengunjung di ListView: ${visitors.length}');
          final visitor = visitors[index];
          return ListTile(
            title: Text(visitor['name']!),
            subtitle: Text('Keperluan: ${visitor['purpose']}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  visitors.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Tambah Pengunjung'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Nama'),
                  ),
                  TextField(
                    controller: purposeController,
                    decoration: const InputDecoration(labelText: 'Keperluan'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Batal'),
                ),
                TextButton(
                  onPressed: addVisitor, // Pastikan addVisitor dipanggil
                  child: const Text('Tambah'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
