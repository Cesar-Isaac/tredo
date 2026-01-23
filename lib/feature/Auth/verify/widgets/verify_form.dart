import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/feature/Auth/verify/controller.dart';
import 'package:tredo/feature/Auth/verify/widgets/pin_code_fields.dart';
import 'package:tredo/feature/Auth/verify/widgets/resent_code_buttom.dart';

class VerifyForm extends StatelessWidget {
  const VerifyForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VerifyPageController>();

    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            PinCodeFields(controller: controller),

            ResentCodeButton(),

            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Obx(() {
                return controller.isLoading.value
                    ? const Center(
                      child: CircularProgressIndicator(color: StyleRepo.orange),
                    )
                    : ElevatedButton(
                      onPressed: controller.confirm,
                      child: Text(
                        tr(LocaleKeys.verify),
                        style: TextStyle(color: StyleRepo.white, fontSize: 16),
                      ),
                    );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
