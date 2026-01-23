import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/image.dart';
import 'package:tredo/core/widgets/svg_icon.dart';
import 'package:tredo/feature/provider_details/controller.dart';
import 'package:tredo/feature/provider_details/widgets/Tab_button.dart';
import 'package:tredo/feature/provider_details/widgets/details_tap.dart';
import 'package:tredo/feature/provider_details/widgets/gallery_tap.dart';
import 'package:tredo/gen/assets.gen.dart';

class ProviderDatails extends StatelessWidget {
  const ProviderDatails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderDatailsController());
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // ================= HEADER  =================
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.5,
                width: double.infinity,
                child: AppImage(
                  path: controller.provider.media.image.first.originalUrl,
                  type: ImageType.CachedNetwork,
                  fit: BoxFit.cover,
                ),
              ),
              PositionedDirectional(
                top: 16,
                start: 16,
                child: SafeArea(
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // ================= BODY  =================
              Positioned(
                bottom: 0,
                child: Container(
                  width: width,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.provider.providerName,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(
                                controller.provider.shopName,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: StyleRepo.foundation.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: SvgPicture.string(
                                    controller.provider.subCategory.svgImage,
                                    color: StyleRepo.grey,
                                  ),
                                ),
                              ),

                              SizedBox(width: 4),
                              Text(
                                controller.provider.subCategory.name,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SvgIcon(
                            icon: Assets.icons.state,
                            color: StyleRepo.orange,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(controller.provider.address),
                          SizedBox(width: 16),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // ===== Tabs =====
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TabButton(
                              label: tr(LocaleKeys.details),
                              selected: controller.currentTab.value == 0,
                              onTap: () => controller.changeTab(0),
                            ),
                            TabButton(
                              label: tr(LocaleKeys.gallery),
                              selected: controller.currentTab.value == 1,
                              onTap: () => controller.changeTab(1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ================= BODY =================
          Expanded(
            child: Obx(() {
              switch (controller.currentTab.value) {
                case 0:
                  return const DetailsTab();
                case 1:
                  return const GalleryTab();
                default:
                  return const DetailsTab();
              }
            }),
          ),
        ],
      ),
    );
  }
}
