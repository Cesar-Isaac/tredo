import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/feature/EntitiesPage/index.dart';
import 'package:tredo/feature/home/index.dart';
import 'package:tredo/feature/main/controller.dart';
import 'package:tredo/feature/main/widgets/nav_bar.dart';
import 'package:tredo/feature/offers/index.dart';
import 'package:tredo/feature/providers/index.dart';
import 'package:tredo/feature/settings/index.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainPageController());

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Obx(() {
              return switch (controller.currentPage.value) {
                0 => HomePage(),
                1 => OffersPage(),
                2 => Providers(),
                3 => EntitiesPage(),
                4 => SettingsPage(),
                _ => throw UnimplementedError(),
              };
            }),
          ),
          Obx(() => controller.showNavBar.value
              ? LayoutBuilder(
                  builder: (context, constraints) {
                    Future.delayed(Duration.zero, controller.updateCenterX);
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomNavBar(),
                    );
                  },
                )
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
