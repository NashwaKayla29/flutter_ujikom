import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/Qc_response.dart'; // ganti sesuai lokasi file model kamu

class QcController extends GetxController {
  var isLoading = true.obs;
  var qcList = <Data>[].obs;

  @override
  void onInit() {
    fetchQc();
    super.onInit();
  }

  void fetchQc() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('http://192.168.0.122:8000/api/qc'), // Ganti sesuai IP kamu
        headers: {
          'Accept': 'application/json',
          // 'Authorization': 'Bearer token' jika pakai auth
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        qc model = qc.fromJson(jsonData);
        qcList.value = model.data ?? [];
      } else {
        Get.snackbar("Error", "Gagal mengambil data QC");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading(false);
    }
  }
}
