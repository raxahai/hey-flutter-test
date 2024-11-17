import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt counter = 0.obs;

  void incrementCounter() {
    counter++;
  }
}
