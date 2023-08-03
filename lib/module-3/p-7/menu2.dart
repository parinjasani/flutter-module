/*
2.Context Menu:

The Context Menu in Flutter is similar to the Context Menu in Android. It appears as a floating menu when the user performs a long-press on a specific widget or UI element.
It offers actions that are relevant and specific to the selected UI element.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  BuildContext? context;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Context Menu Demo'),
        ),
        body: Center(
          child: GestureDetector(
            onLongPress: () {
              showContextMenu(context);
            },
            child: Container(
              width: 150,
              height: 150,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }

  void showContextMenu(BuildContext context) {
    final RenderObject? overlay = Overlay.of(context).context.findRenderObject();
    final position = RelativeRect.fromRect(
      Offset.zero & overlay!.semanticBounds.size,
      Offset.zero & overlay!.semanticBounds.size,
    );
    final ctxMenu = PopupMenuButton<Color>(
      initialValue: Colors.blue,
      itemBuilder: (context) => [
        PopupMenuItem<Color>(
          value: Colors.red,
          child: Text('Red'),
        ),
        PopupMenuItem<Color>(
          value: Colors.green,
          child: Text('Green'),
        ),
        PopupMenuItem<Color>(
          value: Colors.blue,
          child: Text('Blue'),
        ),
      ],
      onSelected: (color) {
        showToast('Background color changed to ${color.toString()}');
      },
    );
    showMenu(context: context, position: position, items: ctxMenu.itemBuilder(context));
  }

  void showToast(String message) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
