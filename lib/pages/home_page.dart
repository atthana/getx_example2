import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example2/pages/counter_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HOME PAGE',
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              Get.to(CounterPage(),
                  arguments: {'position': 'Flutter dev', 'salary': '15000'});
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CounterPage()));
            },
            tooltip: 'Increment',
            child: Icon(Icons.next_plan),
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () => Get.snackbar('title', 'message',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                ),
            child: Text(
              'Show\nsnack bar',
              style: TextStyle(fontSize: 8),
            ),
          )
        ],
      ),
    );
  }
}
