import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/image.dart';
import 'package:tredo/feature/EntitiesPage/controller.dart';
import 'package:tredo/feature/EntitiesPage/widgets/grid_entities.dart';

class EntitiesPage extends StatelessWidget {
  const EntitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EntitiesPageController());
    return Stack(
      children: [
        AppImage(
          width: double.infinity,
          path: "assets/image/HeaderBackground.png",
          type: ImageType.Asset,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                tr(LocaleKeys.Government_entities),
                style: TextStyle(
                  color: StyleRepo.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),

            Expanded(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: StyleRepo.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: GridEntities(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
