import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorSelectionScreen(),
    );
  }
}

class ColorSelectionScreen extends StatefulWidget {
  @override
  _ColorSelectionScreenState createState() => _ColorSelectionScreenState();
}

class _ColorSelectionScreenState extends State<ColorSelectionScreen> {
  Color _selectedColor = Colors.white; // Default color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Selection'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: Colors.red,
                  groupValue: _selectedColor,
                  onChanged: (color) {
                    setState(() {
                      _selectedColor = color as Color;
                    });
                  },
                ),
                Text('Red'),
                Radio(
                  value: Colors.green,
                  groupValue: _selectedColor,
                  onChanged: (color) {
                    setState(() {
                      _selectedColor = color as Color;
                    });
                  },
                ),
                Text('Green'),
                Radio(
                  value: Colors.amber,
                  groupValue: _selectedColor,
                  onChanged: (color) {
                    setState(() {
                      _selectedColor = color as Color;
                    });
                  },
                ),
                Text('Amber'),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                color: _selectedColor,
                child: Center(
                  child: Text(
                    'Screen Color',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
