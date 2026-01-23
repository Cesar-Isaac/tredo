import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/localization/strings.dart';
import '../../../core/style/repo.dart';
import '../../../core/widgets/svg_icon.dart';
import '../../../gen/assets.gen.dart';
import '../controller.dart';

class FormContactUs extends StatelessWidget {
  const FormContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ContactUsPageController>();
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: controller.firstName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: tr(LocaleKeys.first_name),
                prefixIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: 2,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgIcon(icon: Assets.icons.user, color: StyleRepo.orange),
                      SizedBox(width: 5),
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
            SizedBox(height: 12),
            TextFormField(
              controller: controller.lastName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: tr(LocaleKeys.last_name),
                prefixIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: 2,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgIcon(icon: Assets.icons.user, color: StyleRepo.orange),
                      SizedBox(width: 5),
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

            SizedBox(height: 12),
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
            SizedBox(height: 12),
            Stack(
              children: [
                TextFormField(
                  controller: controller.messages,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: tr(LocaleKeys.description),
                    contentPadding: const EdgeInsets.fromLTRB(48, 16, 16, 16),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return tr(LocaleKeys.this_field_is_required);
                    }
                    return null;
                  },
                ),
                PositionedDirectional(
                  top: 12,
                  start: 12,
                  child: SvgIcon(
                    icon: Assets.icons.description,
                    color: StyleRepo.orange,
                  ),
                ),
              ],
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
                              child: Text(tr(LocaleKeys.send)),
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
