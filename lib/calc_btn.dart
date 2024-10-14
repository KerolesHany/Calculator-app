import 'package:flutter/material.dart';

class CalcBtn extends StatelessWidget {
  String btnNumber;
  CalcBtn({super.key, required this.btnNumber, required this.onPressed});
  void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(1),
        child: ElevatedButton(
          onPressed: () => onPressed(btnNumber),
          style: ElevatedButton.styleFrom(
            shape: const LinearBorder(),
            backgroundColor: Colors.blue,
          ),
          child: Text(
            btnNumber,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
