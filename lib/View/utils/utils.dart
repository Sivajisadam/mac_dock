import 'package:flutter/material.dart';
import 'package:mac_dock/Controller/home_screen_controller.dart';

Widget buildDockItem(int index, HomeScreenController controller) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    width: controller.hoveredIndex.value == index ? 60 : 40,
    height: controller.hoveredIndex.value == index ? 60 : 40,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        if (controller.hoveredIndex.value == index)
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
      ],
    ),
    child: Icon(
      controller.bottomNavItems[index].icon,
      size: controller.hoveredIndex.value == index ? 30 : 20,
      color:
          controller.hoveredIndex.value == index ? Colors.blue : Colors.black,
    ),
  );
}
