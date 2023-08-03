import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CitySelectionScreen(),
    );
  }
}

class CitySelectionScreen extends StatefulWidget {
  @override
  _CitySelectionScreenState createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {
  String _selectedCity = '';

  List<String> _cities = [
    'Surat',
    'Vadodara',
    'Ahmedabad',
    'Mumbai',
    'Delhi',
  ];

  void _showCitySelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a city'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              _cities.length,
                  (index) => RadioListTile(
                title: Text(_cities[index]),
                value: _cities[index],
                groupValue: _selectedCity,
                onChanged: (value) {
                  setState(() {
                    _selectedCity = value.toString();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected City:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              _selectedCity,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _showCitySelectionDialog(context);
              },
              child: Text('Select City'),
            ),
          ],
        ),
      ),
    );
  }
}
