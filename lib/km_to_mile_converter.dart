import 'package:flutter/material.dart';

class KmToMileConverterScreen extends StatefulWidget {
  const KmToMileConverterScreen({Key? key}) : super(key: key);

  @override
  State<KmToMileConverterScreen> createState() => _KmToMileConverterScreenState();
}

class _KmToMileConverterScreenState extends State<KmToMileConverterScreen> {
  final TextEditingController _kmController = TextEditingController();
  double? _miles;

  void _convert() {
    final km = double.tryParse(_kmController.text);
    if (km != null) {
      setState(() {
        _miles = km * 0.621371;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Конвертация: км в мили',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Количество километров:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _kmController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Введите число...',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            SizedBox(
              child: ElevatedButton(
                onPressed: _convert,
                child: const Text(
                  'Конвертировать в мили',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (_miles != null)
              Text(
                'Результат: ${_miles!.toStringAsFixed(3)} миль',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
              ),
          ],
        ),
      ),
    );
  }
}
