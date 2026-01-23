import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/routes/routes.dart';

import '../../core/config/app_builder.dart';
import '../../core/localization/strings.dart';
import '../../core/services/rest_api/api_service.dart';
import '../../core/services/rest_api/constants/end_points.dart';
import '../../core/services/rest_api/models/request.dart';
import '../../core/services/rest_api/models/response_model.dart';
import '../../core/style/repo.dart';

class ChangePasswordController extends GetxController{
  final AppBuilder appBuilder = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController oldPassword,newPassword,newPasswordConfirmation;
  late final String token;
  var isFormValid = false.obs;
  var isLoading = false.obs;

  void validateForm() {
    isFormValid.value = oldPassword.text.isNotEmpty &
        newPassword.text.isNotEmpty &
        newPasswordConfirmation.text.isNotEmpty;
  }


  final obscureOldPassword = true.obs;
  void toggleOldPasswordVisibility() {
    obscureOldPassword.value = !obscureOldPassword.value;
  }
  var obscureNewPassword = true.obs;
  void toggleNewPasswordVisibility() {
    obscureNewPassword.value = !obscureNewPassword.value;
  }
  var obscureNewPasswordConfirmation = true.obs;
  void toggleNewConfirmPasswordVisibility() {
    obscureNewPasswordConfirmation.value = !obscureNewPasswordConfirmation.value;
  }

  Future<void> resetPassword() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    final token = appBuilder.token;
    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.change_password,
        method: RequestMethod.Post,
        header: {"Authorization": "Bearer $token"},
        body: {
          "old_password": oldPassword.text,
          "new_password": newPassword.text,
          "new_password_confirmation": newPasswordConfirmation.text,
        },
      ),
    );

    isLoading.value = false;

    if (response.success) {
      Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: StyleRepo.orange, size: 60),
                const SizedBox(height: 15),
                Text(
                  tr(LocaleKeys.password_changed_successfully),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: StyleRepo.orange,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  tr(LocaleKeys.password_change_complete_You_can_now_log_in_with_your_new_password),
                  style: TextStyle(
                    fontSize: 14,
                    color: StyleRepo.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: StyleRepo.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    appBuilder.logout();
                    Get.offNamedUntil(Pages.login.value, (route) => false);
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: false,
      );
    } else {
      Get.snackbar(
        tr(LocaleKeys.error),
        response.message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: StyleRepo.red,
        colorText: StyleRepo.white,
      );
    }
  }


  @override
  void onInit() {
    oldPassword = TextEditingController()..addListener(validateForm);
    newPassword = TextEditingController()..addListener(validateForm);
    newPasswordConfirmation = TextEditingController()..addListener(validateForm);
    super.onInit();
  }
}