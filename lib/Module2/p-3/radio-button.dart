
import 'package:flutter/material.dart';
import 'package:module/Module2/p-3/second-page.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: ArithmeticOperations());
  }
}

class ArithmeticOperations extends StatefulWidget {
  const ArithmeticOperations({Key? key}) : super(key: key);

  @override
  State<ArithmeticOperations> createState() => _ArithmeticOperationsState();
}

class _ArithmeticOperationsState extends State<ArithmeticOperations> {
  var First = TextEditingController();
  var Second = TextEditingController();
  int result =0;
  String? Operation;
  void getValues(String? value){
    setState(() {
      int a = int.tryParse(First.text) ?? 0;
      int b = int.tryParse(Second.text) ?? 0;
      Operation=value;
      switch(Operation){
        case "Add":
          result=a+b;
          break;
        case "Subtract":
          result=a-b;
          break;
        case "Multiply":
          result=a*b;
          break;
        case "Divide":
          result=a~/b;
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  TextField(
                    controller: First,
                    decoration: InputDecoration(labelText: "Enter number1"),
                  ),
                  TextField(
                    controller: Second,
                    decoration: InputDecoration(labelText: "Enter number2"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RadioListTile(title: Text("Addition"),value: 'Add', groupValue: Operation, onChanged: (value) {
                    getValues(value);
                  },),
                  RadioListTile(title: Text("substraction"),value: 'Subtract', groupValue: Operation, onChanged: (value) {
                    getValues(value);
                  },),
                  RadioListTile(title: Text("multiplication"),value: 'Multiply', groupValue: Operation, onChanged: (value) {
                    getValues(value);


                  },),
                  RadioListTile(title: Text("division"),value: 'Divide', groupValue: Operation, onChanged: (value) {
                    getValues(value);
                  },),
                  Text("$result",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(result),));

                  }, child: Text("Next"))


                ],
              )),
        ),
      ),
    );
  }
}
