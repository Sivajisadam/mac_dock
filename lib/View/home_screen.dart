import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_dock/Controller/home_screen_controller.dart';
import 'package:mac_dock/View/bottom_nav.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Align(alignment: Alignment.bottomCenter, child: BottonNavBar()),
    );
  }
}
