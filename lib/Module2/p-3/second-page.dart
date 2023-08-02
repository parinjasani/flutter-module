import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  int result;
  SecondPage(this.result);

  @override
  State<SecondPage> createState() => _SecondPageState(this.result);
}

class _SecondPageState extends State<SecondPage> {
  final int? result;
  _SecondPageState(this.result);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second page"),),
      body: Center(child: Text("Result is $result",style: TextStyle(fontSize: 28),)),

    );
  }
}
