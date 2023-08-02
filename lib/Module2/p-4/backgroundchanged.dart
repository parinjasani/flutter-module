import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(BackgroundChangerApp());
}

class BackgroundChangerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BackgroundChangerPage(),
    );
  }
}

class BackgroundChangerPage extends StatefulWidget {
  @override
  _BackgroundChangerPageState createState() => _BackgroundChangerPageState();
}

class _BackgroundChangerPageState extends State<BackgroundChangerPage> {
  Color _backgroundColor = Colors.white; // Initial background color

  // List of colors to be used as backgrounds
  List<Color> _availableColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.amber
  ];

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor =
      _availableColors[Random().nextInt(_availableColors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Background Changer'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: _changeBackgroundColor,
            child: Text('Change Background'),
          ),
        ),
      ),
    );
  }
}
