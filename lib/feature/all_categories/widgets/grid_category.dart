import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/svg_icon.dart';
import 'package:tredo/feature/all_categories/controller.dart';
import 'package:tredo/feature/all_categories/widgets/card_category.dart';
import 'package:tredo/gen/assets.gen.dart';

class GridCategory extends StatelessWidget {
  const GridCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AllCategoriesController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            onChanged: controller.onSearchChanged,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgIcon(
                  icon: Assets.icons.settingsSlider,
                  color: StyleRepo.grey,
                ),
              ),
              prefixIcon: Icon(Icons.search, color: StyleRepo.grey),
              hintText: tr(LocaleKeys.search),
            ),
          ),
        ),
        const Expanded(child: CardCategory()),
      ],
    );
  }
}
