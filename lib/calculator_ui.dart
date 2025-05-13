import 'package:flutter/material.dart';
import 'km_to_mile_converter.dart';

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({Key? key}) : super(key: key);

  @override
  _CalculatorUIState createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  String display = '0';

  final List<String> buttons = const [
    '7', '8', '9', '/',
    '4', '5', '6', 'x',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
  ];

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        display = '0';
      } else if (buttonText == '=') {
        display = '0';
      } else {
        display = display == '0' ? buttonText : display + buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Калькулятор')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(24),
                child: Text(
                  display,
                  style: const TextStyle(fontSize: 56),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () => buttonPressed(buttons[index]),
                    child: Text(
                      buttons[index],
                      style: const TextStyle(fontSize: 35),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KmToMileConverterScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40), // Increase padding
                textStyle: const TextStyle(fontSize: 20), // Increase font size for bigger text
              ),
              child: const Text('Конвертация: км в мили'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}