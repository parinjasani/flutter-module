import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Reverse(),
    );
  }
}

class Reverse extends StatefulWidget {
  const Reverse({Key? key}) : super(key: key);

  @override
  State<Reverse> createState() => _ReverseState();
}

class _ReverseState extends State<Reverse> {
  var _num = new TextEditingController();
  var _revController = TextEditingController();
  var rev = "";

  void reverse() {
    setState(() {
      String userValue = _num.text;
      for (int i = userValue.length - 1; i >= 0; i--) {
        rev += userValue[i];
        _revController.text = rev;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1-example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    rev = value.split('').reversed.join();
                  });
                },
                keyboardType: TextInputType.number,
                controller: _num,
                decoration: InputDecoration(
                    labelText: "enter the number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            width: 200,
            child: TextField(
              controller: TextEditingController(text: rev),
            ),
          )
        ],
      ),
    );
  }
}
