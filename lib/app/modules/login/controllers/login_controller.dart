import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_ujikom/app/modules/dashboard/views/dashboard_view.dart';
import 'package:project_ujikom/app/utils/api.dart';

class LoginController extends GetxController {
  final RxBool isPasswordVisible = false.obs;
  final _getConnect = GetConnect();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authToken = GetStorage();

  void loginNow() async {
    try {
      print('Mengirim request ke: ${BaseUrl.login}'); // Debugging

      final response = await _getConnect.post(
        BaseUrl.login,
        {
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
        },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.body != null) {
        if (response.body.containsKey('access_token')) {
          String? token = response.body['access_token'];
          if (token != null && token.isNotEmpty) {
            authToken.write('auth_token', token);
            print('Navigasi ke DashboardView...');
            Get.offAll(() => const DashboardView());
          } else {
            showError('Token tidak valid.');
          }
        } else {
          showError('Response tidak mengandung token.');
        }
      } else {
        showError('Response body kosong.');
      }
    } catch (e) {
      showError('Terjadi kesalahan: $e');
    }
  }

  void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      icon: const Icon(Icons.error),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      forwardAnimationCurve: Curves.bounceIn,
      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
    );
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
