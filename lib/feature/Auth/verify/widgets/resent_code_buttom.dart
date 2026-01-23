import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/feature/Auth/verify/controller.dart';

class ResentCodeButton extends StatelessWidget {
  const ResentCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VerifyPageController>();

    return Obx(() {
      return Column(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: tr(LocaleKeys.dont_receive_code),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: StyleRepo.grey),
                ),
                TextSpan(
                  text:
                      controller.isResendActive.value
                          ? tr(LocaleKeys.time_ended)
                          : controller.formattedTime,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: StyleRepo.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed:
                controller.isResendActive.value
                    ? () {
                      controller.resendOtp();
                    }
                    : null,
            child: Text(
              tr(LocaleKeys.resend_code),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: StyleRepo.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    });
  }
}
