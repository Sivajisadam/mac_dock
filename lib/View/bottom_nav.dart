import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_dock/Controller/home_screen_controller.dart';
import 'package:mac_dock/View/utils/utils.dart';

class BottonNavBar extends GetWidget<HomeScreenController> {
  const BottonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 80,
          alignment: Alignment.center,
          width: Get.width * 0.7,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    List.generate(controller.bottomNavItems.length, (index) {
                  return Draggable(
                    data: index,
                    onDragStarted: () {
                      controller.startIndex(index.toString());
                    },
                    onDragEnd: (details) {
                      controller.hoveredIndex(99);
                      controller.replaceIcon(index);
                    },
                    feedback: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(controller.bottomNavItems[index].icon)),
                    childWhenDragging: const SizedBox.shrink(),
                    maxSimultaneousDrags: 1,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        MouseRegion(
                          onEnter: (_) {
                            controller.hoveredIndex(index);
                          },
                          onExit: (_) => controller.hoveredIndex(99),
                          child: TweenAnimationBuilder(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.elasticOut,
                            tween: Tween<double>(
                              begin: 0,
                              end: controller.hoveredIndex.value == index
                                  ? 1.0
                                  : 0,
                            ),
                            builder: (context, value, child) {
                              return Transform.translate(
                                offset: Offset(0, -value * 6),
                                child: buildDockItem(index, controller),
                              );
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.hoveredIndex.value == index,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.black54,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}
