import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/image.dart';
import 'package:tredo/feature/splash_screen/controller.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());

    return Container(
      decoration: BoxDecoration(
          color: StyleRepo.green1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: AppImage(
              fit: BoxFit.cover,
              width: 300,
                height: 300,
                path:"assets/image/splashScreen.jpg",
                type: ImageType.Asset
            ),
          ),

        ],
      ),
    );
  }
}
