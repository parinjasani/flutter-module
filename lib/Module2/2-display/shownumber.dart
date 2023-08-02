import 'package:flutter/material.dart';

class NumberDisplayScreen extends StatelessWidget {
  final int firstNumber;
  final int secondNumber;

  NumberDisplayScreen(this.firstNumber, this.secondNumber);

  @override
  Widget build(BuildContext context) {
    final numberList =
    List<int>.generate(secondNumber - firstNumber + 1, (i) => i + firstNumber);

    return Scaffold(
      appBar: AppBar(
        title: Text('Number Range App'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: numberList.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${numberList[index]}'),
          ),
        ),
      ),
    );
  }
}

