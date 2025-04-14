import 'package:get/get.dart';

import '../controllers/potong_controller.dart';

class PotongBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PotongController>(
      () => PotongController(),
    );
  }
}
