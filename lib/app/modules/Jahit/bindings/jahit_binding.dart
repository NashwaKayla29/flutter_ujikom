import 'package:get/get.dart';

import '../controllers/jahit_controller.dart';

class JahitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JahitController>(
      () => JahitController(),
    );
  }
}
