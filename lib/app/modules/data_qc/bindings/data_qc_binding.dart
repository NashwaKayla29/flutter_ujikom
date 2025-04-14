import 'package:get/get.dart';

import '../controllers/data_qc_controller.dart';

class DataQcBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataQcController>(
      () => DataQcController(),
    );
  }
}
