import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> message = Get.arguments;
    print(message);
    print(message.runtimeType);
    print(message['position']);
    print(message['salary']);
    var count = 25;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(message['position'].toString()),
            Text(message['salary'].toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: () => Get.back(result: 'Hi Q'),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
