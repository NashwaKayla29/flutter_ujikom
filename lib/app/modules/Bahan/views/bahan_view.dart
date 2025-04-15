import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bahan_controller.dart';
import 'package:intl/intl.dart';

class BahanView extends GetView<BahanController> {
  const BahanView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BahanController>();

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
                  bahan.namaBahan ?? '-',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text("Ukuran: ${bahan.ukuranBahan ?? '-'}"),
                    Text("Tanggal Masuk: ${bahan.tanggalMasukBahan ?? '-'}"),
                    Text("Masa: ${bahan.masaBahan ?? '-'}"),
                    Text("Yard: ${bahan.yard ?? '-'}"),
                    Text("Stok: ${bahan.stok ?? '-'}"),
                    Text("Keterangan: ${bahan.keterangan ?? '-'}"),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => _FormTambahBahan(controller: controller),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  String formatRupiah(double harga) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatCurrency.format(harga);
  }
}

class _FormTambahBahan extends StatefulWidget {
  final BahanController controller;

  const _FormTambahBahan({required this.controller});

  @override
  State<_FormTambahBahan> createState() => _FormTambahBahanState();
}

class _FormTambahBahanState extends State<_FormTambahBahan> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final ukuranController = TextEditingController();
  final tanggalController = TextEditingController();
  final masaController = TextEditingController();
  final yardController = TextEditingController();
  final stokController = TextEditingController();
  final keteranganController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Tambah Data Bahan"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _inputField("Nama Bahan", namaController),
              _inputField("Ukuran Bahan", ukuranController),
              _inputField("Tanggal Masuk (YYYY-MM-DD)", tanggalController),
              _inputField("Masa Bahan", masaController),
              _inputField("Yard", yardController, isNumber: true),
              _inputField("Stok", stokController, isNumber: true),
              _inputField("Keterangan", keteranganController),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Batal")),
        ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await widget.controller.addBahan(
                  nama: namaController.text,
                  ukuranBahan: ukuranController.text,
                  tanggalMasukBahan: tanggalController.text,
                  masaBahan: masaController.text,
                  yard: yardController.text,
                  stok: stokController.text,
                  keterangan: keteranganController.text,
                );


                Navigator.of(context).pop();
              }
            },
            child: const Text("Simpan"))
      ],
    );
  }

  Widget _inputField(String label, TextEditingController controller,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? 'Wajib diisi' : null,
      ),
    );
  }
}
