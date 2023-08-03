import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlertDialogDemo(),
    );
  }
}

class AlertDialogDemo extends StatelessWidget {
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: Text('This is the content of the AlertDialog.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showResultDialog(context, 'Positive button pressed');
              },
              child: Text('Positive'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showResultDialog(context, 'Negative button pressed');
              },
              child: Text('Negative'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showResultDialog(context, 'Neutral button pressed');
              },
              child: Text('Neutral'),
            ),
          ],
        );
      },
    );
  }

  void _showResultDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialog with Buttons'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAlertDialog(context);
          },
          child: Text('Show AlertDialog'),
        ),
      ),
    );
  }
}
