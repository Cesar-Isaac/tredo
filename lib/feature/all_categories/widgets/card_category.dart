import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tredo/core/constants/controllers_tags.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/services/pagination/options/grid_view.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/error_widget.dart';
import 'package:tredo/feature/all_categories/controller.dart';
import 'package:tredo/feature/home/models/categories.dart';
import 'package:tredo/feature/providers/controller.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CardCategory extends StatelessWidget {
  final bool isHorizontal;
  const CardCategory({super.key, this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AllCategoriesController>();

    return isHorizontal
        ? Obx(() {
          final categories = controller.categories;
          if (categories.isEmpty) {
            return Center(child: Text(tr(LocaleKeys.empty)));
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final category = categories[index];
              final providersCtrl = Get.find<ProvidersController>();
              final isSelected =
                  providersCtrl.selectedCategoryId.value == category.id;

              return GestureDetector(
                onTap: () {
                  controller.selectCategory(index);
                  providersCtrl.changeCategory(category.id);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 63,
                      height: 63,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          color:
                              isSelected
                                  ? StyleRepo.orange.withOpacity(0.1)
                                  : StyleRepo.grey.withOpacity(0.2),
                          child: Center(
                            child: SvgPicture.string(
                              category.svgImage,
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                              color:
                                  isSelected
                                      ? StyleRepo.orange
                                      : StyleRepo.grey.withOpacity(0.2),
                              placeholderBuilder:
                                  (_) => const CircularProgressIndicator(),
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
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                        color: isSelected ? StyleRepo.orange : StyleRepo.grey,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        })
        : GridViewPagination.builder(
          key: const ValueKey('cat_grid'),
          tag: ControllersTags.category_pager,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          fetchApi: controller.fetchCategories,
          fromJson: Categories.fromJson,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          emptyWidget: Center(child: Text(tr(LocaleKeys.empty))),
          errorWidget:
              (error) =>
                  AppErrorWidget(error: error, onRetry: controller.refreshData),
          onControllerInit: (pagerController) {
            controller.pagerController ??= pagerController;
          },
          itemCount: (response) {
            final List data = response.data as List? ?? [];
            return data.length;
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 2.8,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index, category) {
            final providersCtrl = Get.find<ProvidersController>();
            final isSelected =
                providersCtrl.selectedCategoryId.value == category.id;

            return GestureDetector(
              onTap: () {
                controller.selectCategory(index);
                providersCtrl.changeCategory(category.id);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 63,
                    height: 63,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          isSelected
                              ? StyleRepo.orange.withOpacity(0.1)
                              : StyleRepo.grey.withOpacity(0.1),
                      border:
                          isSelected
                              ? Border.all(color: StyleRepo.orange, width: 1.5)
                              : null,
                    ),
                    child: Center(
                      child: SvgPicture.string(
                        category.svgImage,
                        width: 30,
                        height: 30,
                        color: isSelected ? StyleRepo.orange : StyleRepo.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    category.name,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? StyleRepo.orange : StyleRepo.grey,
                    ),
                  ),
                ],
              ),
            );
          },
        );
  }
}
