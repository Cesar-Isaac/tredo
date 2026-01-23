import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tredo/core/config/app_builder.dart';
import 'package:tredo/core/config/role.dart';
import 'package:tredo/core/routes/routes.dart';
import 'package:tredo/core/services/rest_api/api_service.dart';
import 'package:tredo/core/services/rest_api/constants/end_points.dart';
import 'package:tredo/core/services/rest_api/models/request.dart';
import 'package:tredo/core/services/rest_api/models/response_model.dart';
import 'package:tredo/core/services/state_management/obs.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/feature/Auth/signup/models/cities.dart';
import 'package:tredo/feature/Auth/signup/models/state.dart';
import 'package:tredo/feature/Auth/widgets/const.dart';

import 'package:flutter/material.dart';

class SignUpPageController extends GetxController {
  final AppBuilder appBuilder = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController firstName,
      lastName,
      phone,
      state,
      city,
      password,
      confirmPassword;

  var isFormValid = false.obs;
  var isLoading = false.obs;

  ObsList<StateModel> states = ObsList([]);
  ObsList<Cities> cities = ObsList([]);
  var selectedState = Rxn<StateModel>();
  var selectedCity = Rxn<Cities>();

  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;

  void validateForm() {
    isFormValid.value =
        firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        city.text.isNotEmpty &&
        state.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty;
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  @override
  void onInit() {
    firstName = TextEditingController()..addListener(validateForm);
    lastName = TextEditingController()..addListener(validateForm);
    phone = TextEditingController()..addListener(validateForm);
    state = TextEditingController()..addListener(validateForm);
    city = TextEditingController()..addListener(validateForm);
    password = TextEditingController()..addListener(validateForm);
    confirmPassword = TextEditingController()..addListener(validateForm);

    fetchStates();

    super.onInit();
  }

  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    phone.dispose();
    state.dispose();
    city.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.onClose();
  }

  fetchStates() async {
    ResponseModel response = await APIService.instance.request(
      Request(endPoint: EndPoints.cities, fromJson: StateModel.fromJson),
    );

    if (response.success) {
      states.value = response.data;
    } else {
      states.error = response.message;
    }
  }

  fetchCities(int stateId) async {
    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: "${EndPoints.cities}?stateId=$stateId",
        fromJson: Cities.fromJson,
      ),
    );

    if (response.success) {
      cities.value = response.data;
    } else {
      cities.value = [];
      cities.error = response.message;
    }
  }

  Future<void> confirm() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.register,
        method: RequestMethod.Post,
        body: {
          "first_name": firstName.text,
          "last_name": lastName.text,
          "phone": phone.text,
          "password": password.text,
          "password_confirmation": confirmPassword.text,
          "city_id": selectedCity.value!.id,
        },
      ),
    );

    isLoading.value = false;
    debugPrint(
      "first name : ${firstName.text}, last name: ${lastName.text}, phone: ${phone.text},password: ${password.text},city id:${selectedCity.value!.id}",
    );

    if (response.success) {
      appBuilder.setRole(Role.new_user);
      Get.offAllNamed(
        Pages.verifiy.value,
        arguments: {"phone": phone.text, "purpose": Purpose.register},
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
        "Error",
        response.message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: StyleRepo.red,
        colorText: StyleRepo.white,
      );
    }
  }

}
