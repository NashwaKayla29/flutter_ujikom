import 'dart:convert';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:project_ujikom/app/data/bahan_response.dart';

class BahanController extends GetxController {
  static const String baseUrl = 'http://192.168.0.122:8000/api/bahan';
  final Dio dio = Dio();
  var isLoading = false.obs;
  var bahanList = <Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBahan();
  }

  Future<void> fetchBahan() async {
    try {
      isLoading(true);

      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is Map<String, dynamic> && data.containsKey('data')) {
          final List rawList = data['data'];
          bahanList.assignAll(rawList.map((e) => Data.fromJson(e)).toList());
        } else {
          Get.snackbar('Gagal', 'Format data tidak sesuai');
        }
      } else {
        Get.snackbar('Gagal', 'Kode status: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> addBahan({
    required String nama,
    required String ukuranBahan,
    required String tanggalMasukBahan,
    required String masaBahan,
    required String yard,
    required String stok,
    required String keterangan,
  }) async {
    try {
      isLoading(true);

      final response = await dio.post(
        baseUrl,
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }),
        data: jsonEncode({
          'nama_bahan': nama,
          'ukuran_bahan': ukuranBahan,
          'tanggal_masuk_bahan': tanggalMasukBahan,
          'masa_bahan': masaBahan,
          'yard': yard,
          'stok': stok,
          'keterangan': keterangan,
        }),
      );

      if (response.statusCode == 201) {
        Get.snackbar('Berhasil', 'Data bahan berhasil ditambahkan');
        fetchBahan(); // Refresh data
      } else {
        final message =
            response.data['message'] ?? 'Terjadi kesalahan saat menambahkan';
        Get.snackbar('Gagal', message);
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal menambahkan data: $e');
    } finally {
      isLoading(false);
    }
  }
}
