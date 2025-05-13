import 'package:flutter/material.dart';
import 'km_to_mile_converter.dart';

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({Key? key}) : super(key: key);

  @override
  _CalculatorUIState createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {   // класс, где описывается логика и ui
  String display = '0';    // текущий текст

  final List<String> buttons = const [    // список кнопок
    '7', '8', '9', '/',
    '4', '5', '6', 'x',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
  ];

  void buttonPressed(String buttonText) {   // обработка нажатия на кнопку
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
      appBar: AppBar(title: const Text('Калькулятор')),     // панель с названием
      body: SingleChildScrollView(                        // основная часть экрана
        child: Column(
          children: [
            SizedBox(      // блок с введенным выражением или результатом
              height: MediaQuery.of(context).size.height * 0.3,
              child: Container(
                alignment: Alignment.bottomRight,   // выравнивание по правому краю
                padding: const EdgeInsets.all(24),   // отступы внутри контейнера
                child: Text(
                  display,     // показывает текущее значение
                  style: const TextStyle(fontSize: 56),
                ),
              ),
            ),

            GridView.builder(    // сетка с кнопками
              shrinkWrap: true,     // -- размер подстраивается под содержимое
              physics: const NeverScrollableScrollPhysics(),  // без прокрутки
              itemCount: buttons.length,   // кол-во кнопок
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),  // 4 кнопки в ряд
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),  // отступы между кнопками
                  child: ElevatedButton(
                    onPressed: () => buttonPressed(buttons[index]),   // обработка нажатия
                    child: Text(
                      buttons[index],   // текст на кнопке
                      style: const TextStyle(fontSize: 35),   // размер текста
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),    // отступ перед кнопкой км в мили
            ElevatedButton(             // кнопка перехода на экран км в мили
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KmToMileConverterScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),  // размер кнопки
                textStyle: const TextStyle(fontSize: 20),       // размер текста
              ),
              child: const Text('Конвертация: км в мили'),   // текст на кнопке
            ),
            const SizedBox(height: 20),   // отступ внизу
          ],
        ),
      ),
    );
  }
}