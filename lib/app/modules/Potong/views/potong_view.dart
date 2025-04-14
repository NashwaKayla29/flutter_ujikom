import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/potong_controller.dart';

class PotongView extends StatelessWidget {
  const PotongView({super.key});

  @override
  Widget build(BuildContext context) {
    final PotongController controller = Get.put(PotongController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Potong'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.potongList.isEmpty) {
          return const Center(child: Text('Tidak ada data potong'));
        }

        return ListView.builder(
          itemCount: controller.potongList.length,
          itemBuilder: (context, index) {
            final item = controller.potongList[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(item.hasilPotongPola ?? 'No Hasil'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jumlah Potong: ${item.jumlahPotong ?? 0}'),
                    Text('Tanggal: ${item.tanggalPotong ?? ''}'),
                    Text('Bahan: ${item.bahan?.namaBahan ?? '-'}'),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
