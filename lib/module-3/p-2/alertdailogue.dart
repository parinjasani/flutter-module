import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
          title: Text('Log-out'),
          content: Text('Are sure want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),

            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Yes'),

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
        title: Text('AlertDialog Demo'),
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
