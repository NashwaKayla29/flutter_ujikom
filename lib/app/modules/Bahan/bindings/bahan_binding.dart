import 'package:get/get.dart';

import '../controllers/bahan_controller.dart';

class BahanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BahanController>(
      () => BahanController(),
    );
  }
}
