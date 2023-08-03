import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BackButtonScreen(),
    );
  }
}

class BackButtonScreen extends StatelessWidget {
  Future<bool> _onBackPressed(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Exit'),
        content: Text('Do you want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back button dailogue'),
      ),
      body: WillPopScope(
        onWillPop: () => _onBackPressed(context),
        child: Center(
          child: Text(
            'please enter back button to exit',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
