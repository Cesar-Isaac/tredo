import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/image.dart';
import 'package:tredo/feature/provider_details/controller.dart';

const double _kAspectRatio = 16 / 9;
class SliderOfferPage extends StatelessWidget {
  SliderOfferPage({super.key});

  final Rx<int> _currentAd = 0.obs;
  int get currentAd => _currentAd.value;
  set currentAd(int value) => _currentAd.value = value;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProviderDatailsController>();
    final gallery = controller.provider.media.gallery;

    if (gallery.isEmpty) {
      return Container(
        height: 220,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: StyleRepo.lightGrey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(
              Icons.photo_library_outlined,
              size: 50,
              color: StyleRepo.grey,
            ),
            SizedBox(height: 8),
            Text(
              tr(LocaleKeys.no_gallery_images),
              style: TextStyle(
                color: StyleRepo.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }


    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, _) => currentAd = index,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: _kAspectRatio,
          ),
          items: gallery.map((slider) {
            return AspectRatio(
              aspectRatio: _kAspectRatio,
              child: AppImage(
                width: double.infinity,
                path: slider.originalUrl,
                errorWidget: const Icon(
                  Icons.signal_wifi_statusbar_connected_no_internet_4,
                  color: StyleRepo.grey,
                  size: 50,
                ),
                type: ImageType.CachedNetwork,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              gallery.length,
                  (index) => Obx(
                    () => AnimatedContainer(
                  duration: 300.milliseconds,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: currentAd == index ? 12 : 6,
                  width: currentAd == index ? 12 : 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentAd == index
                        ? StyleRepo.orange
                        : StyleRepo.lightGrey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
