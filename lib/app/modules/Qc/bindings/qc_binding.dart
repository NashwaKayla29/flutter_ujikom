import 'package:get/get.dart';

import '../controllers/qc_controller.dart';

class QcBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QcController>(
      () => QcController(),
    );
  }
}
