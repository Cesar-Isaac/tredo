import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/services/state_management/widgets/obs_widget.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/feature/home/controller.dart';

import '../../../core/widgets/image.dart';
import 'home_contents.dart';

class BestOffers extends StatelessWidget {
  const BestOffers({super.key});

  @override
  Widget build(BuildContext context) {
    final controoler = Get.find<HomePageController>();
    return HomeContentList(
      title: tr(LocaleKeys.Best_Offers_just_for_you),
      content: SizedBox(
        height: 162,
        width: double.infinity,
        child: ObsListBuilder(
          obs: controoler.offers,
          builder: (context, offers) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: offers.length,
              separatorBuilder: (_, __) => SizedBox(width: 12),
              itemBuilder: (context, index) {
                final offer = offers[index];
                return SizedBox(
                  width: 143,
                  height: 162,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: AppImage(
                      path: offer.media.image.first.originalUrl,
                      type: ImageType.CachedNetwork,
                      fit: BoxFit.contain,
                      errorWidget:  Icon(
                                            Icons.signal_wifi_statusbar_connected_no_internet_4,
                                            color: StyleRepo.white,size: 30,),
                    ),
                  ),
                );
              
              },
            );
          },
        ),
      ),
    );
  }
}
