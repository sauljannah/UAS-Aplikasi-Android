import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  double? result;

  void calculateSum() {
    final double num1 = double.parse(controller1.text);
    final double num2 = double.parse(controller2.text);
    setState(() {
      result = num1 + num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Angka Pertama'),
            ),
            TextField(
              controller: controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Angka Kedua'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateSum,
              child: const Text('Hitung'),
            ),
            const SizedBox(height: 20),
            if (result != null)
              Text('Hasil: $result', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
