import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _celsiusController = TextEditingController();
  String _result = '';

  void _convertTemperature() {
    final String input = _celsiusController.text;
    if (input.isEmpty) {
      setState(() {
        _result = 'Please enter a value.';
      });
      return;
    }

    final double? celsius = double.tryParse(input);
    if (celsius == null) {
      setState(() {
        _result = 'Invalid input. Enter a number.';
      });
      return;
    }

    final double fahrenheit = (celsius * 9 / 5) + 32;
    setState(() {
      _result = '${fahrenheit.toStringAsFixed(2)} °F';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Celsius to Fahrenheit Converter',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _celsiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter temperature in Celsius',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 25, 185, 110),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color.fromARGB(255, 182, 15, 15),
                ),
              ),
              child: Text(
                _result.isEmpty ? 'Result' : _result,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
