import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/DataPegawai_response.dart';

class DataPegawaiController extends GetxController {
  var isLoading = true.obs;
  var dataPegawai = <Data>[].obs;

  @override
  void onInit() {
    fetchDataPegawai();
    super.onInit();
  }

  Future<void> fetchDataPegawai() async {
    try {
      isLoading(true);
      final response =
          await http.get(Uri.parse('http://192.168.43.51:8000/api/data_pegawai'));

      if (response.statusCode == 200) {
        final result = DataPegawai_response.fromJson(jsonDecode(response.body));
        if (result.success == true && result.data != null) {
          dataPegawai.assignAll(result.data!);
        } else {
          Get.snackbar("Gagal", result.message ?? "Tidak ada data");
        }
      } else {
        Get.snackbar("Error", "Gagal memuat data pegawai");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
