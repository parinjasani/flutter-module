import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gmail App'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Inbox'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InboxScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Sent'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SentScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Drafts'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DraftsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.mail),
            title: Text('Email $index'),
            subtitle: Text('This is a sample email'),
            trailing: Icon(Icons.star_border),
          );
        },
      ),
    );
  }
}

class SentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sent'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.send),
            title: Text('Sent Email $index'),
            subtitle: Text('This is a sent email'),
          );
        },
      ),
    );
  }
}

class DraftsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drafts'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.drafts),
            title: Text('Draft Email $index'),
            subtitle: Text('This is a draft email'),
          );
        },
      ),
    );
  }
}
