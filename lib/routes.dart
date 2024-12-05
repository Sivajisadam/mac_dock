import 'package:get/get.dart';
import 'package:mac_dock/Controller/home_screen_binding.dart';
import 'package:mac_dock/View/home_screen.dart';

class Routes {
  static const String homeScreen = "/HomeScreen";
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: Routes.homeScreen,
        page: () => const HomeScreen(),
        binding: HomeScreenBinding())
  ];
}
