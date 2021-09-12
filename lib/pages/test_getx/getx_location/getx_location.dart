import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example2/pages/test_getx/getx_location/alert_dialog.dart';
import 'package:getx_example2/pages/test_getx/getx_location/getx_network_manager.dart';
import 'package:getx_example2/pages/test_getx/simple_state_management/counter_controller.dart';

class GetxLocation extends StatefulWidget {
  GetxLocation({Key key}) : super(key: key);

  @override
  _GetxLocationState createState() => _GetxLocationState();
}

class _GetxLocationState extends State<GetxLocation> {
  final GetXNetworkManager _networkManager = Get.put(GetXNetworkManager());

  @override
  Widget build(BuildContext context) {
    print('-----build-----');
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX check location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('The connectivity now is:\n\n'),
            GetBuilder<GetXNetworkManager>(
              builder: (builder) => Text(
                (_networkManager.connectionType == 0)
                    ? 'No Internet'
                    : (_networkManager.connectionType == 1)
                        ? 'You are Connected to Wifi'
                        : 'You are Connected to Mobile Internet',
                style: TextStyle(fontSize: 20),
              ),
            ),

            // Obx(() => Text(_networkManager.connectionType.value.toString()))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showErrorDialog(
            context,
            'Please turn off wifi during use application',
            showButton: true,
            onOkay: () => null,
          );
        },
        tooltip: 'Increment',
        label: Text('Check connectivity'),
      ),
    );
  }
}
