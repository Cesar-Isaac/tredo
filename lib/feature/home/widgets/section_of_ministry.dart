import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tredo/core/services/state_management/widgets/obs_widget.dart';
import 'package:tredo/core/widgets/svg_icon.dart';
import 'package:tredo/feature/home/controller.dart';

import '../../../core/style/repo.dart';
import '../../../gen/assets.gen.dart';

class SectionOfMinistry extends StatelessWidget {
  const SectionOfMinistry({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();
    return SizedBox(
      height: 64,
      width: double.infinity,
      child: ObsListBuilder(
        obs: controller.entities,
        builder: (context, entities) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: entities.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final entity = entities[index];
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: StyleRepo.deepGreen,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: SvgPicture.string(entity.svgImage,fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) =>  Icon(
                                            Icons.signal_wifi_statusbar_connected_no_internet_4,
                                            color: StyleRepo.white,size: 30,),),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        entity.name,
                        style: const TextStyle(
                          color: StyleRepo.foundation,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SvgIcon(
                      icon: Assets.icons.phoneOutline,
                      color: StyleRepo.foundation,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
