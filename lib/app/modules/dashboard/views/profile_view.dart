import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';

class ProfileView extends GetView {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#e8ecd7'),
        appBar: AppBar(
          title: const Text('Profil Saya'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Get.defaultDialog(
                  title: "Logout",
                  middleText: "Apakah Anda yakin ingin logout?",
                  textConfirm: "Ya",
                  textCancel: "Batal",
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    controller.logout();
                  },
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Obx(() {
            final user = controller.user.value;

            if (user == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username: ${user.name}",
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text("Email: ${user.email}",
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text("Created At: ${user.createdAt}",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("Updated At: ${user.updatedAt}",
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
            );
          }),
        ));
  }
}
