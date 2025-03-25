import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#ffff'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  // 'https://gist.githubusercontent.com/olipiskandar/2095343e6b34255dcfb042166c4a3283/raw/d76e1121a2124640481edcf6e7712130304d6236/praujikom_kucing.json',
                  'assets/lottie/fashion.json',
                  width: 400,
                  height: 400,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Lunera Fashion',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
