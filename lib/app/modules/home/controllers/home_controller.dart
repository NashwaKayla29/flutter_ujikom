import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_ujikom/app/modules/dashboard/views/dashboard_view.dart';
import 'package:project_ujikom/app/modules/login/views/login_view.dart';

class HomeController extends GetxController {
  final authToken = GetStorage();
  late Timer _pindah;
  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();
    _pindah = Timer.periodic(
      const Duration(seconds: 4),
      (timer) => authToken.read('token') == null
          ? Get.off(
              () => const LoginView(),
              transition: Transition.leftToRight,
            )
          : Get.off(() => const DashboardView()),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _pindah.cancel();
  }
}
