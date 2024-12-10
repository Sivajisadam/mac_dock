import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mac_dock/Model/dock_model.dart';

class HomeScreenController extends GetxController {
  RxInt hoveredIndex = (-1).obs;
  RxBool isHovering = false.obs;
  RxBool isDragging = false.obs;
  RxString startIndex = "".obs;
  RxList<DockItem> bottomNavItems = [
    DockItem(icon: Brand(Brands.chrome), label: 'Chrome'),
    DockItem(icon: Brand(Brands.music), label: 'Music'),
    DockItem(icon: Brand(Brands.app_store), label: 'App Store'),
    DockItem(icon: Brand(Brands.phone), label: 'Phone'),
    DockItem(icon: Brand(Brands.settings), label: 'Settings'),
    DockItem(icon: Brand(Brands.calendar_app), label: 'Calendar'),
  ].obs;

  void replaceIcon(index, {type}) {
    DockItem temp = DockItem();

    temp = bottomNavItems[int.parse(startIndex.value)];
    bottomNavItems.removeAt(int.parse(startIndex.value));
    bottomNavItems.insert(index, temp);
    bottomNavItems.refresh();
    hoveredIndex(index);
  }
}
