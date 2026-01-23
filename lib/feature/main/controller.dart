import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class MainPageController extends GetxController {
  RxInt currentPage = 0.obs;
  RxDouble currentX = 0.0.obs;
  RxBool showNavBar = true.obs;

  final List<GlobalKey> iconKeys = List.generate(5, (_) => GlobalKey());

  void onTap(int index) {
    currentPage.value = index;
    updateCenterX();
  }

  void updateCenterX() {
    final key = iconKeys[currentPage.value];
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final center = position.dx + renderBox.size.width / 2;
      currentX.value = center;
    }
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration.zero, updateCenterX);
  }
}

