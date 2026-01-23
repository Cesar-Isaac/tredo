
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/image.dart';
import 'package:tredo/feature/all_categories/controller.dart';
import 'package:tredo/feature/all_categories/widgets/card_category.dart';
import 'package:tredo/feature/all_categories/widgets/grid_category.dart';
import 'package:tredo/feature/providers/controller.dart';
import 'package:tredo/feature/providers/widgets/card_service.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryCtrl = Get.put(AllCategoriesController());
    final providersCtrl = Get.put(ProvidersController());

    return Scaffold(
      body: Stack(
        children: [
          const AppImage(
            width: double.infinity,
            path: "assets/image/HeaderBackground.png",
            type: ImageType.Asset,
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Obx(() {
                  final isFiltered =
                      providersCtrl.selectedCategoryId.value != null;

                  String title = tr(LocaleKeys.all_categories);

                  if (isFiltered) {
                    final selectedCategory =
                        categoryCtrl.categories.firstWhereOrNull(
                      (e) => e.id == providersCtrl.selectedCategoryId.value,
                    );
                    if (selectedCategory != null) {
                      title = selectedCategory.name;
                    }
                  }

                  return Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          if (isFiltered) {
                            providersCtrl.changeCategory(null);
                            categoryCtrl.selectedCategory.value = -1;
                          } else {
                            Get.back();
                          }
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: StyleRepo.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.sizeOf(context).width * 0.10),
                    ],
                  );
                }),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Obx(() {
                    final isFiltered =
                        providersCtrl.selectedCategoryId.value != null;

                    if (!isFiltered) {
                      return const GridCategory();
                    } else {
                      return Column(
                        children: [
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 110,
                            child: CardCategory(isHorizontal: true),
                          ),
                          const Divider(thickness: 1, height: 1),
                          const Expanded(
                            child: CardService(),
                          ),
                        ],
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}