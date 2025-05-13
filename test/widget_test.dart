import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_package_name/main.dart'; // Replace with actual package name

void main() {
  testWidgets('Calculator UI loads and converter button is visible', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    // Check if the calculator title is present
    expect(find.text('Calculator'), findsOneWidget);

    // Check if the 'Km to Miles Converter' button is visible
    expect(find.text('Km to Miles Converter'), findsOneWidget);
  });
}

