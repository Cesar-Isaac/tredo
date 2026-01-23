import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tredo/core/config/app_builder.dart';
import 'package:tredo/core/routes/routes.dart';
import 'package:tredo/core/services/rest_api/api_service.dart';
import 'package:tredo/core/services/rest_api/constants/end_points.dart';
import 'package:tredo/core/services/rest_api/models/request.dart';
import 'package:tredo/core/services/rest_api/models/response_model.dart';
import 'package:tredo/core/services/state_management/obs.dart';
import 'package:tredo/feature/settings/models/profile.dart';

class SettingsPageController extends GetxController {
  final AppBuilder appBuilder = Get.find();
  late final String token;
  var isLoading = false.obs;
  var selectedCategory = 0.obs;

  void selectCategory(int index) {
    selectedCategory.value = index;
  }

  RxBool isTranslate = false.obs;

  Future<void> changeLanguage(String langCode, BuildContext context) async {
    final newLocale = Locale(langCode);
    isTranslate.value = (langCode == 'ar');
    await EasyLocalization.of(context)?.setLocale(newLocale);
    Get.updateLocale(newLocale);
  }

  ObsVar<Profile> profile = ObsVar(null);

  fetchProfile() async {
    final token = appBuilder.token;
    isLoading.value = true;
    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.profile,
        fromJson: Profile.fromJson,
        header: {"Authorization": "Bearer $token"},
      ),
    );

    if (response.success) {
      profile.value = response.data;
      profile.refresh();
      profile.error = null;
    } else {
      profile.error = response.message;
    }

    isLoading.value = false;
  }

  LogOut() async {
    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.log_out,
        method: RequestMethod.Delete,
        header: {"Authorization": "Bearer $token"},
      ),
    );
    if (response.success) {
      appBuilder.logout();
      Get.offNamedUntil(Pages.login.value, (route) => false);
    }
  }

  @override
  void onInit() {
    token = appBuilder.token.toString();
    fetchProfile();
    super.onInit();
  }
}
