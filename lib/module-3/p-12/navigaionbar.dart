import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    GalleryScreen(),
    AudioScreen(),
    VideoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Navigation Drawer'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Gallery'),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: Text('Audio'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: Text('Video'),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
      body: _tabs[_currentIndex],
    );
  }
}

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Gallery screen'),
    );
  }
}

class AudioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Audio screen'),
    );
  }
}

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Video scrren'),
    );
  }
}
