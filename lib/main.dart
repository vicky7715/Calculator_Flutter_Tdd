import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stirng Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('String Calculator'),
        ),
        body: CalculatorPage(),
      ),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _calculate() {
    final calculator = StringCalculator();
    setState(() {
      try {
        String inputText = _controller.text.trim();
        print("Original Input: '$inputText'");

        inputText = inputText.replaceAll(RegExp(r'[“”]'), '"');

        if (!inputText.startsWith('"') || !inputText.endsWith('"')) {
          throw FormatException('Input must be in quotes (e.g., "1,2,3")');
        }

        inputText = inputText.substring(1, inputText.length - 1);

        print("Processed Input (quotes removed): '$inputText'");

        inputText = inputText.replaceAll(RegExp(r'[;,]+'), ',');
        print("Sanitized Input: '$inputText'");
        _result = "Sum: ${calculator.add(inputText)}";
      } catch (e) {
        _result = 'Error: ${e.toString()}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Enter numbers in quotes (e.g., \"1,2,3\")",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          // User input field
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter numbers in quotes (e.g., "1,2,3")',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculate,
            child: Text('Calculate'),
          ),
          SizedBox(height: 20),
          if (_result.isNotEmpty)
            Card(
              color: Colors.teal[50],
              margin: const EdgeInsets.symmetric(horizontal: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _result,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.teal[900],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
