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
        _result = calculator.add(_controller.text).toString();
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
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter numbers',
              border: OutlineInputBorder(),
              hintText: 'e.g. 1, 2, 3 or 1\n 2, 3',
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
             FilteringTextInputFormatter.allow(RegExp(r'["\d,]')),
            ],
            maxLines: null,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculate,
            child: Text('Calculate'),
          ),
          SizedBox(height: 20),
          Text(
            'Result: $_result',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
