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
import 'package:tredo/feature/Auth/widgets/const.dart';

class ForgetPasswordPageController extends GetxController {
  final AppBuilder appBuilder = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController phone;
  var isFormValid = false.obs;
  var isLoading = false.obs;

  void validateForm() {
    isFormValid.value = phone.text.isNotEmpty;
  }

  Future<void> confirm() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.forget_password,
        method: RequestMethod.Post,
        body: {"phone": phone.text},
      ),
    );

    isLoading.value = false;

    if (response.success) {
      Get.offAllNamed(
        Pages.verifiy.value,
        arguments: {"phone": phone.text, "purpose": Purpose.forgetPassword},
      );
      Get.snackbar(
        "Message",
        "Your Otp Code is: 1111",
        snackPosition: SnackPosition.TOP,
        backgroundColor: StyleRepo.white,
        colorText: StyleRepo.black,
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
    phone = TextEditingController()..addListener(validateForm);
    super.onInit();
  }

  @override
  void onClose() {
    phone.dispose();
    super.onClose();
  }
}
