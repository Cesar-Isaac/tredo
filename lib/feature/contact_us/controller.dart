import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/services/rest_api/api_service.dart';
import 'package:tredo/core/services/rest_api/constants/end_points.dart';
import 'package:tredo/core/services/rest_api/models/request.dart';
import 'package:tredo/core/services/rest_api/models/response_model.dart';
import 'package:tredo/core/style/repo.dart';

class ContactUsPageController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController firstName, lastName, phone, messages;
  var isLoading = false.obs;

  Future<void> confirm() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.contact_us,
        method: RequestMethod.Post,
        body: {
          "first_name": firstName.text,
          "last_name": lastName.text,
          "phone": phone.text,
          "message": messages.text,
        },
      ),
    );

    isLoading.value = false;

    if (response.success) {
      firstName.clear();
      lastName.clear();
      phone.clear();
      messages.clear();
      Get.snackbar(
        tr(LocaleKeys.success),
        response.message,
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
    firstName = TextEditingController();
    lastName = TextEditingController();
    phone = TextEditingController();
    messages = TextEditingController();
    super.onInit();
  }
}
