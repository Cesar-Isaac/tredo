import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/routes/routes.dart';
import 'package:tredo/core/services/state_management/widgets/obs_widget.dart';

import '../../../core/style/repo.dart';
import '../controller.dart';
import 'home_contents.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();

    return HomeContentList(
      title: tr(LocaleKeys.Categories),
      seeAll: () => Get.toNamed(Pages.all_categories.value),
      content: SizedBox(
        height: 120,
        child: ObsListBuilder(
          obs: controller.categories,
          builder: (context, categories) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final category = categories[index];
                return Column(
                  children: [
                    SizedBox(
                      width: 63,
                      height: 63,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          color: StyleRepo.grey.withOpacity(0.2),
                          child: Center(
                            child: SvgPicture.string(
                              errorBuilder:
                                  (context, error, stackTrace) => Icon(
                                    Icons
                                        .signal_wifi_statusbar_connected_no_internet_4,
                                    color: StyleRepo.white,
                                    size: 30,
                                  ),
                              category.svgImage,
                              fit: BoxFit.contain,
                              width: 40,
                              height: 40,
                              color: StyleRepo.grey.withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: StyleRepo.grey,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
