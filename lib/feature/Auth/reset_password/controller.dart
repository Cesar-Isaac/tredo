import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tredo/core/config/app_builder.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/routes/routes.dart';
import 'package:tredo/core/services/rest_api/api_service.dart';
import 'package:tredo/core/services/rest_api/constants/end_points.dart';
import 'package:tredo/core/services/rest_api/models/request.dart';
import 'package:tredo/core/services/rest_api/models/response_model.dart';
import 'package:tredo/core/style/repo.dart';

class ResetPasswordPageController extends GetxController {
  final AppBuilder appBuilder = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController password, confirmPassword;
  var isFormValid = false.obs;
  var isLoading = false.obs;
  late final String otp;
  late final String phone;

  void validateForm() {
    isFormValid.value =
        password.text.isNotEmpty && confirmPassword.text.isNotEmpty;
  }

  final obscurePassword = true.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  var obscureConfirmPassword = true.obs;
  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  Future<void> confirm() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    debugPrint(
      "[DEBUG] ResetPasswordPageController -> phone: $phone, otp: ${otp} ,password: ${password.text},password confirmation: ${confirmPassword.text}",
    );

    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.reset_password,
        method: RequestMethod.Post,
        body: {
          "phone": phone,
          "code": otp,
          "password": password.text,
          "password_confirmation": confirmPassword.text,
        },
      ),
    );

    isLoading.value = false;

    if (response.success) {
      Get.offAllNamed(Pages.login.value);
      Get.snackbar(
        tr(LocaleKeys.success),
        "Password reset successfully",
        snackPosition: SnackPosition.TOP,
        backgroundColor: StyleRepo.green,
        colorText: StyleRepo.white,
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
    final arguments = Get.arguments as Map<String, dynamic>;
    password = TextEditingController()..addListener(validateForm);
    confirmPassword = TextEditingController()..addListener(validateForm);
    otp = arguments['Otp'];
    phone = arguments['phone'];

    super.onInit();
  }

  @override
  void onClose() {
    password.dispose();
    confirmPassword.dispose();

    super.onClose();
  }
}
