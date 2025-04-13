import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ujikom/app/modules/data_pegawai/controllers/data_pegawai_controller.dart';

class DataPegawaiView extends GetView<DataPegawaiController> {
  const DataPegawaiView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DataPegawaiController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pegawai'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.dataPegawai.isEmpty) {
          return const Center(child: Text("Tidak ada data pegawai"));
        }

        return ListView.builder(
          itemCount: controller.dataPegawai.length,
          itemBuilder: (context, index) {
            final pegawai = controller.dataPegawai[index];
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(pegawai.namaPegawai![0].toUpperCase(),
                      style: const TextStyle(color: Colors.white)),
                ),
                title: Text(pegawai.namaPegawai ?? "Tanpa Nama"),
                subtitle: Text("ID: ${pegawai.id}"),
              ),
            );
          },
        );
      }),
    );
  }
}
