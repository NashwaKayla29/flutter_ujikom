import 'package:get/get.dart';

import '../modules/Bahan/bindings/bahan_binding.dart';
import '../modules/Bahan/views/bahan_view.dart';
import '../modules/Jahit/bindings/jahit_binding.dart';
import '../modules/Jahit/views/jahit_view.dart';
import '../modules/Potong/bindings/potong_binding.dart';
import '../modules/Potong/views/potong_view.dart';
import '../modules/Qc/bindings/qc_binding.dart';
import '../modules/Qc/views/qc_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/data_pegawai/bindings/data_pegawai_binding.dart';
import '../modules/data_pegawai/views/data_pegawai_view.dart';
import '../modules/data_qc/bindings/data_qc_binding.dart';
import '../modules/data_qc/views/data_qc_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(), // Hapus const jika perlu
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.BAHAN,
      page: () => const BahanView(),
      binding: BahanBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DATA_PEGAWAI,
      page: () => const DataPegawaiView(),
      binding: DataPegawaiBinding(),
    ),
    GetPage(
      name: _Paths.DATA_QC,
      page: () => const DataQcView(),
      binding: DataQcBinding(),
    ),
    GetPage(
      name: _Paths.POTONG,
      page: () => const PotongView(),
      binding: PotongBinding(),
    ),
    GetPage(
      name: _Paths.JAHIT,
      page: () => const JahitView(),
      binding: JahitBinding(),
    ),
    GetPage(
      name: _Paths.QC,
      page: () => const QcView(),
      binding: QcBinding(),
    ),
  ];
}
