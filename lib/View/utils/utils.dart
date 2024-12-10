import 'package:flutter/material.dart';
import 'package:mac_dock/Controller/home_screen_controller.dart';

Widget buildDockItem(int index, HomeScreenController controller) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 100),
    width: controller.hoveredIndex.value == index ? 50 : 40,
    height: controller.hoveredIndex.value == index ? 50 : 40,
    child: Tooltip(
      triggerMode: TooltipTriggerMode.manual,
      decoration: ShapeDecoration(
        color: Colors.grey.shade400,
        shape: const ToolTipCustomShape(),
      ),
      margin: EdgeInsets.zero,
      message: controller.bottomNavItems[index].label,
      textStyle: const TextStyle(color: Colors.black),
      child: controller.bottomNavItems[index].icon,
    ),
  );
}

class ToolTipCustomShape extends ShapeBorder {
  final bool usePadding;
  const ToolTipCustomShape({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 5 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 5));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(5)))
      ..moveTo(rect.bottomCenter.dx - 10, rect.bottomCenter.dy)
      ..relativeLineTo(10, 5)
      ..relativeLineTo(10, -5)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
