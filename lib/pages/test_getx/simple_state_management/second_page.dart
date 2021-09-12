import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Second page'),
            SizedBox(height: 50,),
            RaisedButton(
                child: Text('Go back\n\nBy Get.back())'),
                onPressed: () {
                  Get.back();  // Navigation.popUntil()
                })
          ],
        ),
      ),
    );
  }
}
