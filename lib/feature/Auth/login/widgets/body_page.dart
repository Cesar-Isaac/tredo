import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/routes/routes.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/svg_icon.dart';
import 'package:tredo/feature/Auth/login/controller.dart';
import 'package:tredo/gen/assets.gen.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginPageController>();
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 15),
            TextFormField(
              controller: controller.phone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: tr(LocaleKeys.Write_Your_Phone_Number),
                prefixIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  width: MediaQuery.sizeOf(context).width * 0.26,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgIcon(
                        icon: Assets.icons.phone,
                        color: StyleRepo.orange,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "+963",
                        style: TextStyle(
                          color: StyleRepo.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(width: 1, height: 24, color: StyleRepo.grey),
                    ],
                  ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return tr(LocaleKeys.this_field_is_required);
                }
                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return tr(LocaleKeys.only_numbers_allowed);
                }
                return null;
              },
            ),

            SizedBox(height: 40),
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.obscurePassword.value,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
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

                  hintText: tr(LocaleKeys.Write_password),
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
                          ? Center(
                            child: CircularProgressIndicator(
                              color: StyleRepo.deepGreen,
                            ),
                          )
                          : Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(),
                              onPressed: controller.confirm,
                              child: Text(tr(LocaleKeys.log_in)),
                            ),
                          ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Get.toNamed(Pages.forget_password.value),
                  child: Text(
                    tr(LocaleKeys.forget_password),
                    style: TextStyle(color: StyleRepo.orange),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(color: StyleRepo.grey),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tr(LocaleKeys.dont_have_an_account),
                  style: TextStyle(
                    color: StyleRepo.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () => Get.toNamed(Pages.signup.value),
                  child: Text(
                    tr(LocaleKeys.click_here),

                    style: TextStyle(
                      color: StyleRepo.orange,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: StyleRepo.orange,
                      decorationThickness: 1.5,
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
