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
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack),
            label: 'Audio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Video',
          ),
        ],
      ),
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
      child: Text('Video screen'),
    );
  }
}
