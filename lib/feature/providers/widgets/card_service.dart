// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tredo/core/routes/routes.dart';
// import 'package:tredo/core/services/pagination/options/list_view.dart';
// import '../../../core/constants/controllers_tags.dart';
// import '../../../core/style/repo.dart';
// import '../../../core/widgets/error_widget.dart';
// import '../../../core/widgets/image.dart';
// import '../controller.dart';
// import '../models/providers.dart';

// class CardService extends StatelessWidget {
//   const CardService({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<ProvidersController>();

//     return Obx(() {
//       return ListViewPagination.separated(
//         key: ValueKey('provider_list_${controller.selectedCategoryId.value}'),
//         padding: const EdgeInsets.only(
//           bottom: 140,
//           left: 16,
//           right: 16,
//           top: 16,
//         ),

//         tag:
//             "${ControllersTags.provider_pager}_${controller.selectedCategoryId.value}",
//         fetchApi: controller.fetchProviders,
//         fromJson: ServiceProviders.fromJson,

//         physics: const BouncingScrollPhysics(),
//         errorWidget:
//             (error) => AppErrorWidget(
//               error: error,
//               onRetry: () => controller.refreshData(),
//             ),
//         onControllerInit: (pagerController) {
//           controller.pagerController = pagerController;
//         },
//         itemCount: (response) {
//           final data = response.data as List<dynamic>? ?? [];
//           return data.length;
//         },
//         separatorBuilder: (_, __) => const SizedBox(height: 10),
//         itemBuilder: (context, index, provider) {
//           return InkWell(
//             onTap:
//                 () => Get.toNamed(
//                   Pages.provider_details.value,
//                   arguments: provider,
//                 ),
//             child: Container(
//               width: double.infinity,
//               height: 129,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(13),
//                 border: Border.all(
//                   color: StyleRepo.grey.withOpacity(0.3),
//                   width: 1,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Row(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(9),
//                       child: SizedBox(
//                         width: 100,
//                         height: 100,
//                         child: AppImage(
//                           fit: BoxFit.cover,
//                           path: provider.media.image.first.originalUrl,
//                           type: ImageType.CachedNetwork,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),

//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             provider.providerName,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                               color: StyleRepo.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.visibility_outlined,
//                                 color: StyleRepo.orange,
//                                 size: 16,
//                               ),
//                               const SizedBox(width: 4),
//                               Text(
//                                 "${provider.views} views",
//                                 style: const TextStyle(
//                                   color: StyleRepo.grey,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 8),

//                           SizedBox(
//                             height: 22,
//                             child: ListView.separated(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: provider.tags.length,
//                               separatorBuilder:
//                                   (_, __) => const SizedBox(width: 4),
//                               itemBuilder: (context, tagIndex) {
//                                 return Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 8,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: StyleRepo.foundation.withOpacity(
//                                       0.1,
//                                     ),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       '#${provider.tags[tagIndex].name}',
//                                       style: const TextStyle(
//                                         color: StyleRepo.foundation,
//                                         fontSize: 10,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     Container(
//                       width: 30,
//                       height: 30,
//                       decoration: const BoxDecoration(
//                         color: StyleRepo.orange,
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.arrow_forward_ios,
//                         color: Colors.white,
//                         size: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/routes/routes.dart';
import 'package:tredo/core/services/pagination/options/list_view.dart';
import '../../../core/constants/controllers_tags.dart';
import '../../../core/style/repo.dart';
import '../../../core/widgets/error_widget.dart';
import '../../../core/widgets/image.dart';
import '../controller.dart';
import '../models/providers.dart';

class CardService extends StatelessWidget {
  const CardService({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProvidersController>();

    return Obx(() {
      return ListViewPagination.separated(
        key: ValueKey('provider_list_${controller.selectedCategoryId.value}'),
        padding: const EdgeInsets.only(
          bottom: 140,
          left: 16,
          right: 16,
          top: 16,
        ),
        tag:
            "${ControllersTags.provider_pager}_${controller.selectedCategoryId.value}",
        fetchApi: controller.fetchProviders,
        fromJson: ServiceProviders.fromJson,
        physics: const BouncingScrollPhysics(),
        errorWidget: (error) => AppErrorWidget(
          error: error,
          onRetry: controller.refreshData,
        ),
        onControllerInit: (pagerController) {
          controller.pagerController = pagerController;
        },
        itemCount: (response) {
          final data = response.data as List<dynamic>? ?? [];
          return data.length;
        },
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index, provider) {
          return InkWell(
            onTap: () => Get.toNamed(
              Pages.provider_details.value,
              arguments: provider,
            ),
            child: Container(
              width: double.infinity,
              height: 129,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color: StyleRepo.grey.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: AppImage(
                          fit: BoxFit.cover,
                          path: provider.media.image.first.originalUrl,
                          type: ImageType.CachedNetwork,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            provider.providerName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: StyleRepo.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.visibility_outlined,
                                color: StyleRepo.orange,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${provider.views} views",
                                style: const TextStyle(
                                  color: StyleRepo.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 22,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.tags.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 4),
                              itemBuilder: (context, tagIndex) {
                                return Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: StyleRepo.foundation.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '#${provider.tags[tagIndex].name}',
                                      style: const TextStyle(
                                        color: StyleRepo.foundation,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: StyleRepo.orange,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}


