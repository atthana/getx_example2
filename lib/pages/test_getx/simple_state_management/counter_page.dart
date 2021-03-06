import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example2/pages/test_getx/simple_state_management/counter_controller.dart';
import 'package:getx_example2/pages/test_getx/simple_state_management/second_page.dart';

class CounterGetX extends StatelessWidget {
  CounterGetX({Key key}) : super(key: key);

  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    print('-----build-----');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // GetBuilder<CounterController>(
            //     init: CounterController(),
            //     builder: (value) {
            //       return
            //       Text(
            //         '${value.counter}',
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //     }),
            Text('From Getx()'),
            GetX<CounterController>(
              init: CounterController(),
              builder: (value) {
                return Text(
                  '${value.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Divider(
              thickness: 3,
            ),
            Text('From Obx()'),
            Obx(() => Text(
                  '${counterController.counter}',
                  style: Theme.of(context).textTheme.headline4,
                )),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
                child: Text('Go to second page\n\nBy Get.to(SecondPage())'),
                onPressed: () {
                  Get.to(SecondPage());  // Navigation.push()
                  Get.snackbar('Hi', 'Q-Electronics');
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.find<CounterController>().incrementcounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
