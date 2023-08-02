import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomToolbarScreen(),
    );
  }
}

class CustomToolbarScreen extends StatefulWidget {
  @override
  _CustomToolbarScreenState createState() => _CustomToolbarScreenState();
}

class _CustomToolbarScreenState extends State<CustomToolbarScreen> {
  String _selectedItem = 'setting'; // Default selected item for the spinner
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Toolbar'),
        actions: [
          // Spinner in the toolbar
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                _selectedItem = value;
              });
            },
            itemBuilder: (BuildContext context) {
              return ['setting', 'Account', 'logout']
                  .map((String item) => PopupMenuItem<String>(
                value: item,
                child: Text(item),
              ))
                  .toList();
            },
          ),
          // Search functionality in the toolbar
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Body'),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search results here
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement your search suggestions here
    return Center(
      child: Text('Type to search'),
    );
  }
}
