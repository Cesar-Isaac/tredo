import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/constants/controllers_tags.dart';
import 'package:tredo/core/services/pagination/options/grid_view.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/error_widget.dart';
import 'package:tredo/core/widgets/image.dart';
import 'package:tredo/feature/home/models/offers.dart';
import 'package:tredo/feature/offers/controller.dart';

class CardOffers extends StatelessWidget {
  const CardOffers({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OffersPageController>();

    return GridViewPagination.builder(
      padding: const EdgeInsets.all(16),
      tag: ControllersTags.offer_pager,
      fetchApi: controller.fetchOffers,
      fromJson: Offers.fromJson,
      physics: const AlwaysScrollableScrollPhysics(),
      errorWidget:
          (error) =>
              AppErrorWidget(error: error, onRetry: controller.refreshData),
      onControllerInit:
          (pagerController) => controller.pagerController = pagerController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: (response) {
        final data = response.data as List<dynamic>? ?? [];
        return data.length;
      },
      itemBuilder: (context, index, offer) {
        final String mainImageUrl =
            offer.media.image.isNotEmpty
                ? offer.media.image.first.originalUrl
                : '';

        return SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Stack(
              children: [
                Positioned.fill(
                  child:
                      mainImageUrl.isNotEmpty
                          ? AppImage(
                            path: mainImageUrl,
                            type: ImageType.CachedNetwork,
                            fit: BoxFit.cover,
                          )
                          : Container(
                            color: StyleRepo.grey,
                            child: const Center(
                              child: Icon(
                                Icons.image_not_supported,
                                color: StyleRepo.white,
                              ),
                            ),
                          ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                      color: StyleRepo.black.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          offer.title, // الآن يتم عرض عنوان العرض
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: StyleRepo.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
