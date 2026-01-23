import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/feature/change_password/widgets/form.dart';

import '../../core/localization/strings.dart';
import '../../core/style/repo.dart';
import '../../core/widgets/image.dart';
import 'controller.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordController());
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
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.white, width: 0.7),
                  ),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: StyleRepo.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  tr(LocaleKeys.change_password),
                  style: TextStyle(
                    color: StyleRepo.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  tr(LocaleKeys.Create_your_new_password_to_access_your_account),
                  style: TextStyle(
                    color: StyleRepo.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

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
                  child: FormChangePassword(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
