import 'package:calclautor_app/calc_btn.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  static const routeName = "CalcScreen";

  const CalculatorScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalculatorScreenState();
    // create state the statfulwidget
  }
}

class CalculatorScreenState extends State {
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          textAlign: TextAlign.center,
          "Calculator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  textAlign: TextAlign.right,
                  result,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcBtn(btnNumber: "7", onPressed: onDigitClicked),
                CalcBtn(btnNumber: "8", onPressed: onDigitClicked),
                CalcBtn(btnNumber: "9", onPressed: onDigitClicked),
                CalcBtn(btnNumber: "*", onPressed: onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcBtn(btnNumber: "4", onPressed: onDigitClicked),
                CalcBtn(btnNumber: "5", onPressed: onDigitClicked),
                CalcBtn(btnNumber: "6", onPressed: onDigitClicked),
                CalcBtn(btnNumber: "/", onPressed: onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcBtn(btnNumber: "1", onPressed: onDigitClicked),
                CalcBtn(btnNumber: "2", onPressed: onDigitClicked),
                CalcBtn(btnNumber: "3", onPressed: onDigitClicked),
                CalcBtn(btnNumber: "+", onPressed: onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcBtn(
                  btnNumber: "=",
                  onPressed: (btnNumber) {
                    onEuqalClicked();
                  },
                ),
                CalcBtn(btnNumber: "0", onPressed: onDigitClicked),
                CalcBtn(btnNumber: ".", onPressed: onDotClicked),
                CalcBtn(btnNumber: "-", onPressed: onOperatorClicked)
              ],
            ),
          )
        ],
      ),
    );
  }

  String savedNumber = "";
  String savedOperator = "";

  void onDigitClicked(String digit) {
    result += digit;
    setState(() {});
  }

  void onOperatorClicked(String operator) {
    if (result.isEmpty) return;

    if (savedOperator.isEmpty) {
      savedNumber = result;
      savedOperator = operator;
    } else {
      calaulate(savedNumber, savedOperator, result);
      savedNumber = result;
      savedOperator = operator;
    }
    result = "";
    setState(() {});
  }

  void calaulate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    switch (operator) {
      case "+":
        result = (num1 + num2).toString();
        break;
      case "-":
        result = (num1 - num2).toString();
        break;
      case "*":
        result = (num1 * num2).toString();
        break;
      case "/":
        result = (num1 / num2).toString();
        break;
      default:
    }
  }

  onEuqalClicked() {
    if (savedNumber.isEmpty) return;
    calaulate(savedNumber, savedOperator, result);
    savedNumber = '';
    savedOperator = '';
    setState(() {});
  }

  onDotClicked(String _) {
    if (result.contains(".")) return;
    result += ".";
    setState(() {});
  }
}
