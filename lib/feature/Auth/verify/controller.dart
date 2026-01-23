import 'dart:async';

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

class VerifyPageController extends GetxController {
  AppBuilder appBuilder = Get.find();

  var isLoading = false.obs;
  RxInt secondsLeft = 120.obs;
  RxBool isResendActive = false.obs;
  late final String purpose;

  late final String phoneNumber;
  // ignore: non_constant_identifier_names
  late final int for_verifiy_account;

  RxString otp = "".obs;

  Timer? _timer;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void startTimer() {
    secondsLeft.value = 120;
    isResendActive.value = false;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft.value == 0) {
        isResendActive.value = true;
        timer.cancel();
      } else {
        secondsLeft.value--;
      }
    });
  }

  String get formattedTime {
    final minutes = (secondsLeft.value ~/ 60).toString().padLeft(2, '0');
    final secs = (secondsLeft.value % 60).toString().padLeft(2, '0');
    return '$minutes : $secs';
  }

  Future<void> confirm() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;

    final int forVerifyAccount =
        // ignore: unrelated_type_equality_checks
        (purpose == Purpose.forgetPassword) ? 0 : 1;

    debugPrint(
      "code: ${otp.value}, phone: $phoneNumber, for_verifiy_account: $forVerifyAccount",
    );

    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.Verify,
        method: RequestMethod.Post,
        body: {
          "code": otp.value,
          "phone": phoneNumber,
          "for_verifiy_account": forVerifyAccount,
        },
      ),
    );

    isLoading.value = false;

    if (response.success) {
      if (purpose == Purpose.forgetPassword) {
        Get.offNamed(
          Pages.reset_password.value,
          arguments: {"phone": phoneNumber, "Otp": otp.value},
        );
      } else if (purpose == Purpose.register || purpose == Purpose.login) {
        Get.offAllNamed(Pages.login.value);
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
  }

  Future<void> resendOtp() async {
    if (!isResendActive.value) return;

    isResendActive.value = false;

    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.resent_otp,
        method: RequestMethod.Post,
        body: {"phone": phoneNumber},
      ),
    );

    if (response.success) {
      Get.snackbar(
        "Message",
        "Your Otp Code is: 1111",
        snackPosition: SnackPosition.TOP,
        backgroundColor: StyleRepo.white,
        colorText: StyleRepo.black,
      );

      startTimer();
    } else {
      isResendActive.value = true;
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
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    final arguments = Get.arguments as Map<String, dynamic>;
    phoneNumber = arguments['phone'];
    purpose = arguments['purpose'];
    startTimer();
    super.onInit();
  }
}

