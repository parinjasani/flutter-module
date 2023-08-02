import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageWithTextView(),
    );
  }
}

class ImageWithTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Images with TextView'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/banana.jpg',height: 100,),
                  Image.asset('assets/images/grapes.jpg',height: 100,),
                ],
              ),
              Center(
                child: Text('Here are four images'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/guava.jpg',height: 100,),
                  Image.asset('assets/images/banana.jpg',height: 100,),
                ],
              )
            ],
          ),
        )
    );
  }
}
