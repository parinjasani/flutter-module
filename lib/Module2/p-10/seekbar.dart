import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorChangerScreen(),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  @override
  _ColorChangerScreenState createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  double redValue = 0.0;
  double greenValue = 0.0;
  double blueValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Changer'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Red: ${redValue.toInt()}'),
            Slider(
              value: redValue,
              min: 0,
              max: 255,
              onChanged: (value) {
                setState(() {
                  redValue = value;
                });
              },
            ),
            Text('Green: ${greenValue.toInt()}'),
            Slider(
              value: greenValue,
              min: 0,
              max: 255,
              onChanged: (value) {
                setState(() {
                  greenValue = value;
                });
              },
            ),
            Text('Blue: ${blueValue.toInt()}'),
            Slider(
              value: blueValue,
              min: 0,
              max: 255,
              onChanged: (value) {
                setState(() {
                  blueValue = value;
                });
              },
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Color selectedColor = Color.fromRGBO(
                    redValue.toInt(),
                    greenValue.toInt(),
                    blueValue.toInt(),
                    1.0,
                  );

                  // Update the background color of the device
                  SystemChrome.setSystemUIOverlayStyle(
                    SystemUiOverlayStyle(
                      systemNavigationBarColor: selectedColor,
                      statusBarColor: selectedColor,
                    ),
                  );
                },
                child: Container(
                  color: Color.fromRGBO(
                    redValue.toInt(),
                    greenValue.toInt(),
                    blueValue.toInt(),
                    1.0,
                  ),
                  child: Center(
                    child: Text(
                      'Tap to Change Background Color',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
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
