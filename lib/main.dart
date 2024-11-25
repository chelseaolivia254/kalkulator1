import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorScreen(),
      theme: ThemeData.dark(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";

  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        num1 = 0;
        num2 = 0;
        operand = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "x" ||
          buttonText == "÷") {
        num1 = double.parse(output);
        operand = buttonText;
        _output = "0";
      } else if (buttonText == ".") {
        if (!_output.contains(".")) {
          _output += buttonText;
        }
      } else if (buttonText == "=") {
        num2 = double.parse(output);

        if (operand == "+") {
          _output = (num1 + num2).toString();
        }
        if (operand == "-") {
          _output = (num1 - num2).toString();
        }
        if (operand == "x") {
          _output = (num1 * num2).toString();
        }
        if (operand == "÷") {
          _output = (num1 / num2).toString();
        }

        num1 = 0;
        num2 = 0;
        operand = "";
      } else {
        _output = (_output == "0") ? buttonText : _output + buttonText;
      }

      output = _output;
    });
  }

  Widget buildButton(String text, {Color? color, Color? textColor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: color ?? Colors.grey[800], // Perbaikan warna
          ),
          onPressed: () => buttonPressed(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomRight,
            child: Text(
              output,
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                children: [
                  buildButton("C", color: Colors.grey, textColor: Colors.black),
                  buildButton("+/-", color: Colors.grey, textColor: Colors.black),
                  buildButton("%", color: Colors.grey, textColor: Colors.black),
                  buildButton("÷", color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("x", color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("-", color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("+", color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.grey[800], // Perbaikan warna
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                        ),
                        onPressed: () => buttonPressed("0"),
                        child: const Text(
                          "0",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  buildButton("."),
                  buildButton("=", color: Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
