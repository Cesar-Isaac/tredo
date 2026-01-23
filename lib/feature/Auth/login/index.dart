import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/image.dart';
import 'package:tredo/feature/Auth/login/controller.dart';
import 'package:tredo/feature/Auth/login/widgets/body_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginPageController());
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
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.09),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  tr(LocaleKeys.log_in_to_your_account),
                  style: TextStyle(
                    color: StyleRepo.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  tr(LocaleKeys.welcome_back_log_in_to_continue),
                  style: TextStyle(
                    color: StyleRepo.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),

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
                  child: BodyPage(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
