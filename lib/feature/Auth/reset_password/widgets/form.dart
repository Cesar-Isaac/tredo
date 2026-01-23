import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/svg_icon.dart';
import 'package:tredo/feature/Auth/reset_password/controller.dart';
import 'package:tredo/gen/assets.gen.dart';

class RessetPasswordForm extends StatelessWidget {
  const RessetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResetPasswordPageController>();
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.obscurePassword.value,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: tr(LocaleKeys.Write_password),
                  suffixIcon: IconButton(
                    icon:
                        controller.obscurePassword.value
                            ? SvgIcon(
                              icon: Assets.icons.invisible,
                              color: StyleRepo.grey,
                            )
                            : SvgIcon(
                              icon: Assets.icons.visible,
                              color: StyleRepo.orange,
                            ),
                    onPressed: controller.togglePasswordVisibility,
                  ),

                  prefixIcon: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    width: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgIcon(
                          icon: Assets.icons.lock,
                          color: StyleRepo.orange,
                        ),
                      ],
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return tr(LocaleKeys.this_field_is_required);
                  }
                  if (value.length < 8) {
                    return tr(
                      LocaleKeys.password_must_be_at_least_8_characters,
                    );
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 30),
            Obx(
              () => TextFormField(
                controller: controller.confirmPassword,
                obscureText: controller.obscureConfirmPassword.value,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon:
                        controller.obscureConfirmPassword.value
                            ? SvgIcon(
                              icon: Assets.icons.invisible,
                              color: StyleRepo.grey,
                            )
                            : SvgIcon(
                              icon: Assets.icons.visible,
                              color: StyleRepo.orange,
                            ),
                    onPressed: controller.toggleConfirmPasswordVisibility,
                  ),

                  hintText: tr(LocaleKeys.confirm_password),
                  prefixIcon: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    width: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgIcon(
                          icon: Assets.icons.lock,
                          color: StyleRepo.orange,
                        ),
                      ],
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return tr(LocaleKeys.this_field_is_required);
                  }
                  if (value != controller.password.text) {
                    return tr(LocaleKeys.passwords_do_not_match);
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Expanded(
                    child:
                        controller.isLoading.value
                            ? Center(
                              child: CircularProgressIndicator(
                                color: StyleRepo.deepGreen,
                              ),
                            )
                            : ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.resolveWith<Color>((
                                      states,
                                    ) {
                                      if (states.contains(
                                        WidgetState.disabled,
                                      )) {
                                        // ignore: deprecated_member_use
                                        return StyleRepo.deepGreen.withOpacity(
                                          0.2,
                                        );
                                      }
                                      return StyleRepo.deepGreen;
                                    }),
                                foregroundColor: WidgetStateProperty.all<Color>(
                                  Colors.white,
                                ),
                              ),
                              onPressed:
                                  controller.isFormValid.value
                                      ? () {
                                        if (controller.formKey.currentState!
                                            .validate()) {
                                          controller.confirm();
                                        }
                                      }
                                      : null,
                              child: Text(tr(LocaleKeys.reset_password)),
                            ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
