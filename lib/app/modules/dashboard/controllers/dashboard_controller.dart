import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_ujikom/app/modules/Bahan/controllers/bahan_controller.dart';

class DashboardController extends GetxController {
  final BahanController bahanController = Get.put(BahanController());

  var isLoading = true.obs;
  var totalBahan = 0.obs;
  var totalStok = 0.obs;

  final token = GetStorage().read('token');

  @override
  void onInit() {
    super.onInit();
    calculateDashboardStats();
  }

  void calculateDashboardStats() {
    ever(bahanController.bahanList, (_) {
      totalBahan.value = bahanController.bahanList.length;
    });
  }

@override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
 