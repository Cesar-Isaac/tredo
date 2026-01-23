import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/style/repo.dart';
import '../../../../core/widgets/svg_icon.dart';
import '../../../../gen/assets.gen.dart';
import '../controller.dart';

class PickImageMyProfile extends StatelessWidget {
  const PickImageMyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditPageController>();

    return Obx(() {
      final profile = controller.profile;
      final imagePath = controller.image.value;

      Widget avatarImage;

      if (imagePath.isNotEmpty && File(imagePath).existsSync()) {
        avatarImage = ClipRRect(
          borderRadius: BorderRadius.circular(65),
          child: Image.file(
            File(imagePath),
            fit: BoxFit.cover,
            width: 130,
            height: 130,
          ),
        );
      } else if (profile?.image != null &&
          profile!.image!.removeAllWhitespace.isNotEmpty) {
        avatarImage = ClipRRect(
          borderRadius: BorderRadius.circular(65),
          child: CachedNetworkImage(
            imageUrl: profile.image!.removeAllWhitespace,
            fit: BoxFit.cover,
            width: 130,
            height: 130,
            placeholder:
                (context, url) =>
                    const Center(child: CircularProgressIndicator()),
            errorWidget:
                (context, url, error) =>
                    Icon(Icons.person, color: StyleRepo.grey, size: 70),
          ),
        );
      } else {
        avatarImage = Icon(Icons.person, color: StyleRepo.grey);
      }

      return Stack(
        alignment: Alignment.bottomRight,
        children: [

          CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 65,
              backgroundColor: Colors.grey.shade200,
              child: avatarImage,
            ),
          ),


          Positioned(
            bottom: 8,
            right: 8,
            child: InkWell(
              onTap: () async => controller.pickImage(),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 41,
                height: 41,
                decoration: const BoxDecoration(
                  color: StyleRepo.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
                child: SvgIcon(
                  icon: Assets.icons.edit,
                  color: StyleRepo.orange,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
