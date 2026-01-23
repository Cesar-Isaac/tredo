import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/routes/routes.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/error_widget.dart';
import 'package:tredo/core/widgets/image.dart';
import 'package:tredo/feature/settings/controller.dart';
import 'package:tredo/feature/settings/widgets/body_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsPageController(), tag: "settings");

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.profile.error != null) {
          return AppErrorWidget(
            error: controller.profile.error!,
            onRetry: controller.fetchProfile,
          );
        }

        if (controller.profile.value == null) {
          return Center(child: Text(tr(LocaleKeys.no_data_available)));
        }

        final profile = controller.profile.value!;
        return Stack(
          children: [
            AppImage(
              width: double.infinity,
              path: "assets/image/HeaderBackground.png",
              type: ImageType.Asset,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    tr(LocaleKeys.Settings),
                    style: TextStyle(
                      color: StyleRepo.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 80),
                        padding: const EdgeInsets.only(top: 100, bottom: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: StyleRepo.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "${profile.firstName} ${profile.lastName}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: StyleRepo.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${profile.city.name},${profile.city.state.name}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: StyleRepo.black,
                              ),
                            ),
                            const SizedBox(height: 20),
                            OutlinedButton(
                              onPressed: () => Get.toNamed(
                                Pages.edit_profile.value,
                                arguments: profile,
                              ),
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: BorderSide(
                                  color: StyleRepo.orange,
                                  width: 1,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                              ),
                              child: Text(
                                tr(LocaleKeys.edit_profile),
                                style: TextStyle(
                                  color: StyleRepo.orange,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Expanded(child: BodySettingsPage()),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 70,
                            child: (profile.image == null || profile.image!.trim().isEmpty)
                                ? Icon(Icons.person, color: StyleRepo.grey, size: 70)
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: AppImage(
                                      width: 140,
                                      fit: BoxFit.cover,
                                      path: "${profile.image}?v=${DateTime.now().millisecondsSinceEpoch}",
                                      type: ImageType.CachedNetwork,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}


