import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/Potong_response.dart'; // pastikan path ini sesuai

class PotongController extends GetxController {
  var isLoading = true.obs;
  var potongList = <Data>[].obs;

  final String baseUrl =
      'http://192.168.0.122:8000/api/potong'; // sesuaikan IP dan endpoint

  @override
  void onInit() {
    fetchPotong();
    super.onInit();
  }

  void fetchPotong() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        final potong = Potong.fromJson(decoded);
        potongList.value = potong.data ?? [];
      } else {
        Get.snackbar("Error", "Gagal mengambil data potong");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading(false);
    }
  }
}
