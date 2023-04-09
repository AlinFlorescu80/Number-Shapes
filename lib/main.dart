import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Shapes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Number Shapes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _inputController = TextEditingController();

 int? number;
 String _result = "";

  void _checkNumber(int number) {
    setState(() {
      int sqrtValue = sqrt(number).toInt();
      int triValue = ((sqrt(8 * number + 1) - 1) / 2).toInt();
      if (sqrtValue * sqrtValue == number && triValue * (triValue + 1) / 2 == number) {
        _result = '$number is a square number and a triangular number.';
      } else if (sqrtValue * sqrtValue == number) {
        _result = '$number is a square number.';
      } else if (triValue * (triValue + 1) / 2 == number) {
        _result = '$number is a triangular number.';
      } else {
        _result = '$number is neither a square nor a triangular number.';
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('$number'),
              content: Text(_result),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            );
          });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:Padding(padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Please input a number to see if it is square or triangular.',
                style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.numberWithOptions(decimal: false),
              onChanged: (value) {
                setState(() {
                  number = int.tryParse(value) ?? 0;
                });
              },
            ),
          ],
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
       _checkNumber(number!);
      },
      child: Icon(Icons.check),
      shape: CircleBorder()),
    );
  }
}
