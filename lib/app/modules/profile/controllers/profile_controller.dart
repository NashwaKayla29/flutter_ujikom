import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/profile_response.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  final isLoading = false.obs;
  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  void fetchProfile() async {
    final token = box.read('access_token');

    print("Token yang dipakai: $token");

    if (token == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar("Error", "Token tidak ditemukan, silakan login ulang.");
      });
      return;
    }

    try {
      isLoading(true);

      final response = await http.get(
        Uri.parse('http://192.168.43.51:8000/api/profile'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE BODY: ${response.body}");

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData is Map<String, dynamic>) {
          final profileResponse = ProfileResponse.fromJson(jsonData);
          user.value = profileResponse.user!;
        } else {
          Get.snackbar("Error", "Format data tidak valid (bukan JSON Map)");
        }
      } else if (response.statusCode == 401) {
        Get.snackbar("Unauthorized", "Sesi login habis, silakan login ulang.");
      } else {
        Get.snackbar(
            "Error", "Gagal mengambil data profil (${response.statusCode})");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async {
    try {
      await box.remove('access_token');
      print("Berhasil logout!");
      Get.offAllNamed('/login');
    } catch (e) {
      print("Error saat logout: $e");
    }
  }
}
