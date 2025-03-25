import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bahan_controller.dart';
import 'package:intl/intl.dart'; // Untuk format harga

class BahanView extends GetView<BahanController> {
  const BahanView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BahanController>(); // Ambil instance controller

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Bahan'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.bahanList.isEmpty) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.warning, size: 50, color: Colors.orange),
                SizedBox(height: 10),
                Text('Tidak ada data bahan', style: TextStyle(fontSize: 16)),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: controller.bahanList.length,
          itemBuilder: (context, index) {
            final bahan = controller.bahanList[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 5),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(15),
                title: Text(
                  bahan.nama,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bahan.ukuranBahan,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bahan.tanggalMasukBahan,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bahan.masaBahan,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bahan.yard,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  String formatRupiah(double harga) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatCurrency.format(harga);
  }
}
