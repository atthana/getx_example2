import 'package:get/get.dart';

class CounterController extends GetxController {
  // Logics and variables will be moved to here.
  // var counter = 0;

  // void incrementcounter() {
  //   counter++;
  //   update();
  // }

  var counter = 0.obs; // Add .obs to any variable to make it observable.
  incrementcounter() => counter++;  // ไม่ต้องใช้ update() แล้ว
}
