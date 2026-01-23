import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/svg_icon.dart';
import 'package:tredo/feature/Auth/forget_password/controller.dart';
import 'package:tredo/gen/assets.gen.dart';

class FormforgetPassword extends StatelessWidget {
  const FormforgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgetPasswordPageController>();
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
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
                                          controller.confirm();
                                        }
                                      }
                                      : null,
                              child: Text(tr(LocaleKeys.send_code)),
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
