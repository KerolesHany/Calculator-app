import 'package:calclautor_app/calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalclautorApp());
}

class CalclautorApp extends StatelessWidget {
  const CalclautorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CalculatorScreen.routeName,
      routes: {
        CalculatorScreen.routeName: (context) => const CalculatorScreen(),
      },
    );
  }
}
