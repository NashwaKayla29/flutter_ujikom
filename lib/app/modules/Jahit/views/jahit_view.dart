import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/jahit_controller.dart';

class JahitView extends StatelessWidget {
  const JahitView({super.key});
  

  @override
  Widget build(BuildContext context) {
    final JahitController controller = Get.put(JahitController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Jahit'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.jahitList.isEmpty) {
          return Center(child: Text("Tidak ada data"));
        }

        return ListView.builder(
          itemCount: controller.jahitList.length,
          itemBuilder: (context, index) {
            final item = controller.jahitList[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(item.namaBarang ?? '-'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tanggal: ${item.tanggalJahit}"),
                    Text("Lolos: ${item.lolos}, Cacat: ${item.cacat}"),
                    Text("Penjahit: ${item.dataPegawai?.namaPegawai ?? '-'}"),
                    Text(
                        "Hasil Potong: ${item.potong?.hasilPotongPola ?? '-'}"),
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
