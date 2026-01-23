import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/image.dart';
import 'package:tredo/feature/Auth/reset_password/controller.dart';
import 'package:tredo/feature/Auth/reset_password/widgets/form.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordPageController());
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
                child: Text(
                  tr(LocaleKeys.reset_password),
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
                  tr(
                    LocaleKeys.Create_your_new_password_to_access_your_account,
                  ),
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
                  child: RessetPasswordForm(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
