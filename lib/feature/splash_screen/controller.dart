import 'package:get/get.dart';
import 'package:tredo/core/config/app_builder.dart';
import 'package:flutter/material.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController rotationController;
  final appBuilder = Get.put(AppBuilder());

  Future<void> loadData() async {
    await 2.seconds.delay();
    appBuilder.init();
    // Get.offNamed(Pages.login.value);
  }

  @override
  void onInit() {
    super.onInit();

    loadData();
  }


}
