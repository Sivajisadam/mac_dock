import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_dock/Model/dock_model.dart';

class HomeScreenController extends GetxController {
  RxInt hoveredIndex = 99.obs;
  RxBool isDragging = false.obs;
  RxString startIndex = "".obs;
  RxList<DockItem> bottomNavItems = [
    DockItem(icon: Icons.home, label: 'Home'),
    DockItem(icon: Icons.search, label: 'Search'),
    DockItem(icon: Icons.favorite, label: 'Favorites'),
    DockItem(icon: Icons.person, label: 'Profile'),
    DockItem(icon: Icons.settings, label: 'Settings'),
    DockItem(icon: Icons.phone, label: 'Phone'),
  ].obs;

  void replaceIcon(index, {type}) {
    DockItem temp = DockItem();

    temp = bottomNavItems[int.parse(startIndex.value)];
    bottomNavItems.removeAt(int.parse(startIndex.value));
    bottomNavItems.insert(index, temp);
    bottomNavItems.refresh();
  }
}
