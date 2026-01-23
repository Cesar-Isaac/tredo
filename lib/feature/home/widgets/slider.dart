import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/services/state_management/widgets/obs_widget.dart';
import '../../../core/style/repo.dart';
import '../../../core/widgets/image.dart';
import '../controller.dart';
import '../models/sliders.dart';

const double _kAspectRatio = 16 / 9;
class SliderPage extends StatelessWidget {
  SliderPage({super.key});

  final Rx<int> _currentAd = 0.obs;
  int get currentAd => _currentAd.value;
  set currentAd(int value) => _currentAd.value = value;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();

    return ObsListBuilder<Sliders>(
      obs: controller.sliders,
      builder: (context, sliders) {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index, _) => currentAd = index,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: _kAspectRatio,
              ),
              items: sliders.map((slider) {
                final imageUrl = slider.image.isNotEmpty
                    ? slider.image
                    : null;

                return AspectRatio(
                  aspectRatio: _kAspectRatio,
                  child: AppImage(
                    width: double.infinity,
                    path: imageUrl ?? "",
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
                  sliders.length,
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
      },
    );
  }
}
