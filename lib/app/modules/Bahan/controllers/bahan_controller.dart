import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bahan {
  final int id;
  final String nama;
  final String ukuranBahan;
  final String tanggalMasukBahan;
  final String masaBahan;
  final String yard;

  Bahan({
    required this.id,
    required this.nama,
    required this.ukuranBahan,
    required this.tanggalMasukBahan,
    required this.masaBahan,
    required this.yard,
  });

  factory Bahan.fromJson(Map<String, dynamic> json) {
    return Bahan(
      id: json['id'],
      nama: json['nama_bahan'] ?? 'Tidak diketahui', // Hindari null pada nama
      ukuranBahan: json['ukuran_bahan'], // Pastikan harga aman
      tanggalMasukBahan: json['tanggal_masuk_bahan'],
      masaBahan: json['masa_bahan'],
      yard: json['yard'], // Hindari null pada stok
    );
  }
}

class BahanController extends GetxController {
  static const String baseUrl = 'http://192.168.43.51:8000/api/bahan';
  var isLoading = false.obs;
  var bahanList = <Bahan>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBahan();
  }

  Future<void> fetchBahan() async {
    try {
      isLoading(true);

      final response = await http.get(Uri.parse(baseUrl), headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        if (jsonResponse is Map<String, dynamic> &&
            jsonResponse.containsKey('data')) {
          var bahanData = jsonResponse['data'];
          if (bahanData is List) {
            bahanList.assignAll(
                bahanData.map((item) => Bahan.fromJson(item)).toList());
          } else {
            Get.snackbar(
                'Error', 'Format data tidak sesuai: Data tidak berupa List');
          }
        } else {
          Get.snackbar(
              'Error', 'Format data tidak sesuai: Tidak ada kunci "data"');
        }
      } else {
        Get.snackbar(
            'Error ${response.statusCode}', 'Gagal mengambil data bahan');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading(false);
    }
  }
}
