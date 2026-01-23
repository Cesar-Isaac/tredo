import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/localization/strings.dart';
import '../../../core/style/repo.dart';
import '../../../core/widgets/svg_icon.dart';
import '../../../gen/assets.gen.dart';
import '../controller.dart';

class FormChangePassword extends StatelessWidget {
  const FormChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChangePasswordController>();
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Obx(()=>
                TextFormField(
                  controller: controller.oldPassword,
                  obscureText: controller.obscureOldPassword.value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: tr(LocaleKeys.old_password),
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      width: MediaQuery.sizeOf(context).width * 0.15,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgIcon(
                            icon: Assets.icons.lock,
                            color: StyleRepo.orange,
                          ),
                          const SizedBox(width: 8),
                          Container(width: 1, height: 24, color: StyleRepo.grey),
                        ],
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon:
                      controller.obscureOldPassword.value
                          ? SvgIcon(
                        icon: Assets.icons.invisible,
                        color: StyleRepo.grey,
                      )
                          : SvgIcon(
                        icon: Assets.icons.visible,
                        color: StyleRepo.orange,
                      ),
                      onPressed: controller.toggleOldPasswordVisibility,
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
            SizedBox(height: 20),
            Obx(()=>
                TextFormField(
                  controller: controller.newPassword,
                  obscureText: controller.obscureNewPassword.value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: tr(LocaleKeys.new_password),
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      width: MediaQuery.sizeOf(context).width * 0.15,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgIcon(
                            icon: Assets.icons.lock,
                            color: StyleRepo.orange,
                          ),
                          SizedBox(width: 5),
                          const SizedBox(width: 8),
                          Container(width: 1, height: 24, color: StyleRepo.grey),
                        ],
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon:
                      controller.obscureNewPassword.value
                          ? SvgIcon(
                        icon: Assets.icons.invisible,
                        color: StyleRepo.grey,
                      )
                          : SvgIcon(
                        icon: Assets.icons.visible,
                        color: StyleRepo.orange,
                      ),
                      onPressed: controller.toggleNewPasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return tr(LocaleKeys.this_field_is_required);
                    }
                    if (value == controller.oldPassword.text) {
                      return tr(LocaleKeys.The_new_password_is_the_same_as_the_old_password);
                    }

                    return null;
                  },
                ),
            ),
            SizedBox(height: 20),
            Obx(()=>
                TextFormField(
                  controller: controller.newPasswordConfirmation,
                  obscureText: controller.obscureNewPasswordConfirmation.value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: tr(LocaleKeys.new_password_confirmation),
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      width: MediaQuery.sizeOf(context).width * 0.15,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgIcon(
                            icon: Assets.icons.lock,
                            color: StyleRepo.orange,
                          ),
                          SizedBox(width: 5),
                          const SizedBox(width: 8),
                          Container(width: 1, height: 24, color: StyleRepo.grey),
                        ],
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon:
                      controller.obscureNewPasswordConfirmation.value
                          ? SvgIcon(
                        icon: Assets.icons.invisible,
                        color: StyleRepo.grey,
                      )
                          : SvgIcon(
                        icon: Assets.icons.visible,
                        color: StyleRepo.orange,
                      ),
                      onPressed: controller.toggleNewConfirmPasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return tr(LocaleKeys.this_field_is_required);
                    } if (value != controller.newPassword.text) {
                      return tr(LocaleKeys.passwords_do_not_match);
                    }
                    return null;
                  },
                ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                      () =>
                  controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : Expanded(
                    child: ElevatedButton(
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
                          controller.resetPassword();
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
