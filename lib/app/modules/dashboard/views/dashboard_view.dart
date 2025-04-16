import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text("Dashboard Lunera"),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildWelcomeCard(),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildDashboardCard(
                    "Bahan", "1", Icons.widgets, Colors.purple[200]!,
                    onTap: () => Get.toNamed("/bahan")),
                _buildDashboardCard(
                    "Data pegawai", "4", Icons.people, Colors.purple[100]!,
                    onTap: () => Get.toNamed("/data-pegawai")),
                _buildDashboardCard(
                    "Data Qc", "6", Icons.verified_user, Colors.cyan[100]!,
                    onTap: () => Get.toNamed("/data-qc")),
                _buildDashboardCard(
                    "Potong", "1", Icons.cut, Colors.green[100]!,
                    onTap: () => Get.toNamed("/potong")),
                _buildDashboardCard(
                    "Jahit", "1", Icons.radio_button_checked, Colors.red[100]!,
                    onTap: () => Get.toNamed("/jahit")),
                _buildDashboardCard(
                    "Qc", "1", Icons.check_circle, Colors.lightGreen[100]!,
                    onTap: () => Get.toNamed("/qc")),
              ],
            ),
            const SizedBox(height: 20),
            const GrafikProduksiView(), // Pindah ke bawah sini
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
      String title, String value, IconData icon, Color color,
      {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: color.withOpacity(0.3),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Selamat Datang di Lunera Fashion 🎉",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
                SizedBox(height: 8),
                Text(
                  "Admin Lunera Fashion!",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            height: 80,
            child: Image(
              image: AssetImage("assets/images/bertiga.png"),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 33, 243, 226)),
            child: Text("Menu",
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: const Icon(Icons.layers),
            title: const Text("Bahan"),
            onTap: () => Navigator.pushNamed(context, "/bahan"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Data Pegawai"),
            onTap: () => Navigator.pushNamed(context, "/data-pegawai"),
          ),
          ListTile(
            leading: const Icon(Icons.fact_check),
            title: const Text("Data Qc"),
            onTap: () => Navigator.pushNamed(context, "/data-qc"),
          ),
          ListTile(
            leading: const Icon(Icons.cut),
            title: const Text("Potong"),
            onTap: () => Navigator.pushNamed(context, "/potong"),
          ),
          ListTile(
            leading: const Icon(Icons.radio_button_checked),
            title: const Text("Jahit"),
            onTap: () => Navigator.pushNamed(context, "/jahit"),
          ),
          ListTile(
            leading: const Icon(Icons.check_circle),
            title: const Text("Qc"),
            onTap: () => Navigator.pushNamed(context, "/qc"),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Profile"),
            onTap: () => Navigator.pushNamed(context, "/profile"),
          ),
        ],
      ),
    );
  }
}

class GrafikProduksiView extends StatelessWidget {
  const GrafikProduksiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Grafik Data Produksi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 6,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final labels = [
                            "Bahan",
                            "Data Pegawai",
                            "Data QC",
                            "Potong",
                            "Jahit",
                            "QC"
                          ];
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              labels[value.toInt()],
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        },
                        interval: 1,
                      ),
                    ),
                  ),
                  barGroups: [
                    _buildBar(0, 2, Colors.blue),
                    _buildBar(1, 1, Colors.pinkAccent),
                    _buildBar(2, 2, Colors.cyan),
                    _buildBar(3, 0, Colors.greenAccent),
                    _buildBar(4, 0, Colors.redAccent),
                    _buildBar(5, 0, Colors.lightGreen),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _buildBar(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 20,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
