import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:project_ujikom/app/data/Jahit_response.dart';

class JahitController extends GetxController {
  var isLoading = true.obs;
  var jahitList = <Data>[].obs;

  final String baseUrl =
      'http://192.168.0.122:8000/api/jahit'; // ganti IP sesuai API lokal kamu

  @override
  void onInit() {
    fetchJahit();
    super.onInit();
  }

  void fetchJahit() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var result = jahit.fromJson(json.decode(response.body));
        jahitList.value = result.data ?? [];
      } else {
        Get.snackbar("Error", "Gagal mengambil data");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
