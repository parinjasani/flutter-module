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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView with Context Menu'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onLongPress: () {
              showOptionsContextMenu(context, items[index], index);
            },
          );
        },
      ),
    );
  }

  void showOptionsContextMenu(BuildContext context, String item, int index) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit'),
                onTap: () {
                  Navigator.pop(context);
                  showEditDialog(context, item, index);
                },
              ),
              ListTile(
                leading: Icon(Icons.visibility),
                title: Text('View'),
                onTap: () {
                  Navigator.pop(context);
                  showViewDialog(context, item);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete'),
                onTap: () {
                  Navigator.pop(context);
                  deleteItem(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showEditDialog(BuildContext context, String item, int index) {
    showDialog(
      context: context,
      builder: (context) {
        String updatedItem = item;
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            onChanged: (value) {
              updatedItem = value;
            },
            controller: TextEditingController(text: item),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  items[index] = updatedItem;
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void showViewDialog(BuildContext context, String item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('View Item'),
          content: Text(item),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }
}
