import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/qc_controller.dart';

class QcView extends GetView<QcController> {
  const QcView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar QC'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.qcList.isEmpty) {
          return const Center(child: Text("Data QC kosong"));
        } else {
          return ListView.builder(
            itemCount: controller.qcList.length,
            itemBuilder: (context, index) {
              final qcItem = controller.qcList[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title:
                      Text("Nama QC: ${qcItem.dataQc?.namaQc ?? 'Tidak Ada'}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Barang: ${qcItem.jahit?.namaBarang ?? '-'}"),
                      Text("Lolos QC: ${qcItem.lolosQc}"),
                      Text("Cacat Jual: ${qcItem.cacatJual}"),
                      Text("Cacat Permanen: ${qcItem.cacatPermanen}"),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
