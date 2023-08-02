import 'package:flutter/material.dart';
import 'package:module/Module2/2-display/shownumber.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Range App',
      home: NumberInputScreen(),
    );
  }
}

class NumberInputScreen extends StatefulWidget {
  @override
  _NumberInputScreenState createState() => _NumberInputScreenState();
}

class _NumberInputScreenState extends State<NumberInputScreen> {
  final _firstNumberController = TextEditingController();
  final _secondNumberController = TextEditingController();

  @override
  void dispose() {
    _firstNumberController.dispose();
    _secondNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Range App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200,
              child: TextField(
                controller: _firstNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: 'Enter first number',
                ),
              ),
            ),
            Container(
              width: 200,
              child: TextField(
                controller: _secondNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: 'Enter second number',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final firstNumber = int.parse(_firstNumberController.text);
                final secondNumber = int.parse(_secondNumberController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NumberDisplayScreen(firstNumber, secondNumber),
                  ),
                );
              },
              child: Text('Show Numbers'),
            ),
          ],
        ),
      ),
    );
  }
}
