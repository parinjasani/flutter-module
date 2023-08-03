import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhoneCallApp(),
    );
  }
}

class PhoneCallApp extends StatefulWidget {
  @override
  _PhoneCallAppState createState() => _PhoneCallAppState();
}

class _PhoneCallAppState extends State<PhoneCallApp> {
  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  Future<void> checkPermission() async {
    bool isPermissionGranted = await _hasPhoneCallPermission();
    if (isPermissionGranted) {
      handlePermissionGranted();
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Phone Call Permission'),
          content: Text('This app needs access to make phone calls.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                handlePermissionDenied();
              },
              child: Text('Deny'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                requestPermission();
              },
              child: Text('Allow'),
            ),
          ],
        ),
      );
    }
  }

  Future<bool> _hasPhoneCallPermission() async {
    try {
      var PermissionGroup;
      final status = await PermissionHandler().checkPermissionStatus(PermissionGroup.phone);
      return status == PermissionStatus.granted;
    } catch (e) {
      return false;
    }
  }

  Future<void> requestPermission() async {
    try {
      await PermissionHandler().requestPermissions([PermissionGroup.phone]);
      bool isPermissionGranted = await _hasPhoneCallPermission();
      if (isPermissionGranted) {
        handlePermissionGranted();
      } else {
        handlePermissionDenied();
      }
    } catch (e) {
      print('Error requesting permission: $e');
    }
  }

  void handlePermissionGranted() {
    print('Phone call permission is granted.');
    // Implement your code to make a phone call here
  }

  void handlePermissionDenied() {
    print('Phone call permission is denied.');
    // Handle the case when the permission is denied
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Call App'),
      ),
      body: Center(
        child: Text('Welcome to the Phone Call App!'),
      ),
    );
  }
}

class PermissionGroup {
  static var phone;
}

class PermissionHandler {
  checkPermissionStatus(phone) {

  }

  requestPermissions(List list) {

  }
}
