import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/routes/routes.dart';
import 'package:tredo/core/services/state_management/widgets/obs_widget.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/error_widget.dart';
import 'package:tredo/core/widgets/svg_icon.dart';
import 'package:tredo/feature/home/widgets/body_page.dart';
import '../../core/widgets/image.dart';
import '../../gen/assets.gen.dart';
import 'controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());
    return Scaffold(
      body: Stack(
        children: [
          AppImage(
            width: double.infinity,
            path: "assets/image/HeaderBackground.png",
            type: ImageType.Asset,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ObsVariableBuilder(
                  obs: controller.profile,
                  errorBuilder:
                      (context, _) => AppErrorWidget(
                        error: controller.profile.error!,
                        onRetry: controller.fetchProfile,
                      ),
                  builder: (context, profile) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: StyleRepo.grey,
                                borderRadius: BorderRadius.circular(23),
                              ),
                              child:
                                  profile.image!.isEmpty
                                      ? Icon(
                                        Icons.person,
                                        size: 40,
                                        color: StyleRepo.white,
                                      )
                                      : ClipRRect(
                                        borderRadius: BorderRadius.circular(23),
                                        child: AppImage(
                                          path: profile.image!,
                                          errorWidget: Icon(
                                            Icons
                                                .signal_wifi_statusbar_connected_no_internet_4,
                                            color: StyleRepo.white,
                                            size: 30,
                                          ),

                                          type: ImageType.CachedNetwork,
                                        ),
                                      ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${profile.firstName} ${profile.lastName}",
                                  style: TextStyle(
                                    color: StyleRepo.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "${profile.city.name},${profile.city.state.name}",
                                  style: TextStyle(
                                    color: StyleRepo.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed:
                              () => Get.toNamed(Pages.notification_page.value),
                          icon: SvgIcon(
                            icon: Assets.icons.notification,
                            color: StyleRepo.white,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),

              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: StyleRepo.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: BodyHomePage(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
