import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tredo/core/constants/controllers_tags.dart';
import 'package:tredo/core/services/pagination/options/grid_view.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/error_widget.dart';
import 'package:tredo/core/widgets/svg_icon.dart';
import 'package:tredo/feature/EntitiesPage/controller.dart';
import 'package:tredo/feature/EntitiesPage/models/entites_model.dart';
import 'package:tredo/feature/EntitiesPage/widgets/entites_details.dart';
import 'package:tredo/gen/assets.gen.dart';

class CardEntites extends StatelessWidget {
  const CardEntites({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EntitiesPageController>();
    return GridViewPagination.builder(
      padding: const EdgeInsets.only(bottom: 140, left: 16, right: 16, top: 16),
      tag: ControllersTags.entites_pager,
      fetchApi: controller.fetchEntities,
      fromJson: Entites.fromJson,
      physics: const AlwaysScrollableScrollPhysics(),
      errorWidget:
          (error) =>
              AppErrorWidget(error: error, onRetry: controller.refreshData),
      onControllerInit:
          (pagerController) => controller.pagerController = pagerController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: (response) {
        final data = response.data as List<dynamic>? ?? [];
        return data.length;
      },
      itemBuilder: (context, index, entities) {
        return GestureDetector(
          onTap: () => EntityDetailsBottomSheet.show(context, entities),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: StyleRepo.deepGreen,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: SvgPicture.string(entities.svgImage),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    entities.name,
                    style: TextStyle(
                      color: StyleRepo.foundation,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SvgIcon(
                  icon: Assets.icons.phoneOutline,
                  color: StyleRepo.foundation,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
