import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/image.dart';
import 'package:tredo/feature/notifications/controller.dart';
import 'package:tredo/feature/notifications/widgets/notifications_list.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(NotificationsController());

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          AppImage(
            width: double.infinity,
            path: "assets/image/HeaderBackground.png",
            type: ImageType.Asset,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back, color: StyleRepo.white),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        tr(LocaleKeys.notificatios),
                        style: TextStyle(
                          color: StyleRepo.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.10),
                ],
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
                  child:

                      NotificationsList(),


              ),)
            ],
          ),
        ],
      ),
    );
  }
}
