import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/DataQc_response.dart'; // sesuaikan dengan path model kamu

class DataQcController extends GetxController {
  var isLoading = true.obs;
  var dataQcList = <Data>[].obs;

  @override
  void onInit() {
    fetchDataQc();
    super.onInit();
  }

  Future<void> fetchDataQc() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse(
            'http://192.168.0.122:8000/api/data_qc'), // ganti dengan IP Laravel kamu
        headers: {
          'Accept': 'application/json',
          
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        var result = dataQc_response.fromJson(jsonData);
        dataQcList.value = result.data ?? [];
      } else {
        Get.snackbar("Error", "Gagal mengambil data QC");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
