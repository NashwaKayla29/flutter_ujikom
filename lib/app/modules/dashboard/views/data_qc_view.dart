import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ujikom/app/modules/data_qc/controllers/data_qc_controller.dart';// sesuaikan dengan path kamu

class DataQcView extends GetView<DataQcController> {
  const DataQcView({super.key});

  @override
  Widget build(BuildContext context) {
    final DataQcController controller = Get.put(DataQcController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data QC'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.dataQcList.isEmpty) {
          return const Center(child: Text("Data QC kosong."));
        }

        return ListView.builder(
          itemCount: controller.dataQcList.length,
          itemBuilder: (context, index) {
            final qc = controller.dataQcList[index];
            return ListTile(
              leading: CircleAvatar(child: Text(qc.id.toString())),
              title: Text(qc.namaQc ?? "-"),
            );
          },
        );
      }),
    );
  }
}
