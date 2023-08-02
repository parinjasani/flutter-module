import 'package:flutter/material.dart';

void main() {
  runApp(FontSizeApp());
}

class FontSizeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FontSizePage(),
    );
  }
}

class FontSizePage extends StatefulWidget {
  @override
  _FontSizePageState createState() => _FontSizePageState();
}

class _FontSizePageState extends State<FontSizePage> {
  double _fontSize = 20.0; // Initial font size

  
  void _increaseFontSize() {
    setState(() {
      _fontSize += 2.0;
    });
  }

 
  void _decreaseFontSize() {
    setState(() {
      _fontSize -= 2.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size Changer'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Font Size',
                style: TextStyle(fontSize: _fontSize),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _decreaseFontSize,
                    child: Text('-'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _increaseFontSize,
                    child: Text('+'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
