import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tredo/core/config/app_builder.dart';
import 'package:tredo/core/localization/strings.dart';

import '../../../core/services/rest_api/api_service.dart';
import '../../../core/services/rest_api/constants/end_points.dart';
import '../../../core/services/rest_api/models/request.dart';
import '../../../core/services/rest_api/models/response_model.dart';
import '../../../core/services/state_management/obs.dart';
import '../../../core/style/repo.dart';
import '../../Auth/signup/models/cities.dart';
import '../../Auth/signup/models/state.dart';
import '../controller.dart';
import '../models/profile.dart';

class EditPageController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AppBuilder appBuilder = Get.find();
  final controllerSettings = Get.find<SettingsPageController>(tag: "settings");

  late TextEditingController firstName, lastName, phone, state, city;
  var isLoading = false.obs;
  late final Profile profile;
  late final String token;
  ObsList<StateModel> states = ObsList([]);
  ObsList<Cities> cities = ObsList([]);
  var selectedState = Rxn<StateModel>();
  var selectedCity = Rxn<Cities>();

 

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

  @override
  void onInit() {
    super.onInit();
    profile = Get.arguments as Profile;
    firstName = TextEditingController(text: profile.firstName);
    lastName = TextEditingController(text: profile.lastName);
    phone = TextEditingController(text: profile.phone);
    state = TextEditingController(text: profile.city.state.name);
    city = TextEditingController(text: profile.city.name);
    if (profile.image != null && profile.image!.isNotEmpty) {
      image.value = profile.image!;
    }

    fetchStates().then((_) {
      selectedState.value = states.value?.firstWhereOrNull(
        (s) => s.id == profile.city.state.id,
      );

      if (selectedState.value != null) {
        fetchCities(selectedState.value!.id).then((_) {
          selectedCity.value = cities.value?.firstWhereOrNull(
            (c) => c.id == profile.city.id,
          );
        });
      }
    });
  }

  RxString image = "".obs;
  RxBool isTranslate = false.obs;

  void toggleTranslation(bool value, BuildContext context) async {
    isTranslate.value = value;
    final newLocale = value ? const Locale('ar') : const Locale('en');
    await EasyLocalization.of(context)?.setLocale(newLocale);
    Get.updateLocale(newLocale);
  }

  void pickImage() async {
    XFile? picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    image.value = picked.path;
  }

  Future<void> save() async {
    final token = appBuilder.token;
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;

    Map<String, dynamic> bodyMap = {
      "first_name": firstName.text,
      "last_name": lastName.text,
      "city_id": selectedCity.value?.id ?? profile.city.id,
    };

    if (image.value.isNotEmpty && !image.value.startsWith("http")) {
      bodyMap["image"] = await MultipartFile.fromFile(
        image.value,
        filename: "avatar.jpg",
      );
    }

    final response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.update_profile,
        method: RequestMethod.Post,
        header: {"Authorization": "Bearer $token"},
        body: FormData.fromMap(bodyMap),
      ),
    );

    isLoading.value = false;

    if (response.success) {
      await controllerSettings.fetchProfile();
      Get.snackbar(
        tr(LocaleKeys.success),
        tr(LocaleKeys.saved),
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
}

