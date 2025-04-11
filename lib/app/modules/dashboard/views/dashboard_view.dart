import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard LUNERA"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 33, 243, 226)),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.layers),
              title: const Text("Bahan"),
              onTap: () {
                Navigator.pushNamed(context, "/bahan");
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text("Data Pegawai"),
              onTap: () {
                Navigator.pushNamed(context, "/pegawai");
              },
            ),
            // const Divider(), // Garis pemisah
            // ListTile(
            //   leading: const Icon(Icons.logout, color: Colors.red),
            //   title: const Text("Logout", style: TextStyle(color: Colors.red)),
            //   onTap: () {
            //     _logout();
            //   },
            // ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildDashboardCard(
                "Bahan", "3", Icons.layers, Colors.blue),
            _buildDashboardCard(
                "Data Pegawai", "5", Icons.people, Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
      String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // void _logout() {
  //   Get.defaultDialog(
  //     title: "Logout",
  //     middleText: "Apakah Anda yakin ingin logout?",
  //     textConfirm: "Ya",
  //     textCancel: "Batal",
  //     confirmTextColor: Colors.white,
  //     onConfirm: () {
  //       // Misalnya, hapus token pengguna dari storage (jika ada)
  //       // Setelah logout, arahkan pengguna ke halaman login
  //       Get.offAllNamed("/login");
  //     },
  //   );
  // }
}
