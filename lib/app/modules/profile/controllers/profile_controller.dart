import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_ujikom/app/data/profile_response.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final box = GetStorage();
  final token = GetStorage().read('access_token');
  final isLoading = false.obs;
  var user = Rxn<User>();

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  void fetchProfile() async {
    print("TOKEN DARI STORAGE: $token");
    try {
      isLoading(true);

      final token = GetStorage().read('access_token');
      if (token == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar("Error", "Token tidak ditemukan, silakan login ulang.");
        });
        return;
      }

      final response = await http.get(
        Uri.parse('http://192.168.0.52:8000/api/profile'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData is Map<String, dynamic>) {
          final profileResponse = ProfileResponse.fromJson(jsonData);
          user.value = profileResponse.user!;
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.snackbar("Error", "Format data tidak valid (bukan JSON)");
          });
        }
      } else if (response.statusCode == 401) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar(
              "Unauthorized", "Sesi login habis, silakan login ulang.");
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar(
              "Error", "Gagal mengambil data profil (${response.statusCode})");
        });
      }
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar("Error", "Terjadi kesalahan: $e");
      });
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> logout() async {
    try {
      final box = GetStorage();
      box.remove('token');

      print("Berhasil logout!");

      Get.offAllNamed('/login'); // arahkan ke halaman login
    } catch (e) {
      print("Error saat logout: $e");
    }
  }
}
