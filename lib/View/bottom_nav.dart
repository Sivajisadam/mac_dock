import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_dock/Controller/home_screen_controller.dart';
import 'package:mac_dock/View/utils/utils.dart';

class BottonNavBar extends GetWidget<HomeScreenController> {
  const BottonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => MouseRegion(
          onExit: (event) {
            controller.isHovering(false);
            controller.hoveredIndex(-1);
          },
          child: Container(
            height: 60,
            alignment: Alignment.center,
            width: Get.width * 0.6,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade50,
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
                        final RenderBox box =
                            context.findRenderObject() as RenderBox;
                        final localPosition = box.globalToLocal(details.offset);
                        final itemWidth =
                            box.size.width / controller.bottomNavItems.length;
                        final dropIndex =
                            (localPosition.dx / itemWidth).floor();

                        controller.replaceIcon(dropIndex);
                      },
                      feedback: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: controller.bottomNavItems[index].icon),
                      childWhenDragging: const SizedBox.shrink(),
                      maxSimultaneousDrags: 1,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          MouseRegion(
                            onHover: (event) {
                              final RenderBox box =
                                  context.findRenderObject() as RenderBox;
                              final localPosition =
                                  box.globalToLocal(event.position);
                              final itemWidth = box.size.width /
                                  controller.bottomNavItems.length;
                              final hoveredIndex =
                                  (localPosition.dx / itemWidth).floor();
                              controller.hoveredIndex(hoveredIndex);
                            },
                            onEnter: (_) {
                              controller.isHovering(true);
                            },
                            child: TweenAnimationBuilder(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOutBack,
                              tween: Tween<double>(
                                begin: 0,
                                end: controller.isHovering.value ? 1.0 : 0,
                              ),
                              builder: (context, value, child) {
                                double distance =
                                    (controller.hoveredIndex.value - index)
                                        .abs()
                                        .toDouble();
                                double elevation = distance <= 2.5
                                    ? (1 - distance / 2.5) * value * 20
                                    : 0;

                                return Transform.translate(
                                  offset: Offset(0, -elevation),
                                  child: buildDockItem(index, controller),
                                );
                              },
                            ),
                          ),
                          Visibility(
                            visible: controller.hoveredIndex.value == index,
                            child: const CircleAvatar(
                              radius: 2,
                              backgroundColor: Colors.black54,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ));
  }
}
