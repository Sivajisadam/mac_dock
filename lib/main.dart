import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_dock/Controller/home_screen_binding.dart';
import 'package:mac_dock/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.homeScreen,
      initialBinding: HomeScreenBinding(),
      getPages: AppPages.pages,
    );
  }
}
