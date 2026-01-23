import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tredo/core/config/app_builder.dart';
import 'package:tredo/core/services/rest_api/api_service.dart';
import 'package:tredo/core/services/rest_api/constants/end_points.dart';
import 'package:tredo/core/services/rest_api/models/request.dart';
import 'package:tredo/core/services/rest_api/models/response_model.dart';
import 'package:tredo/core/services/state_management/obs.dart';
import 'package:tredo/feature/Auth/signup/models/cities.dart';
import 'package:tredo/feature/Auth/signup/models/state.dart';
import 'package:tredo/feature/EntitiesPage/models/entites_model.dart';
import 'package:tredo/feature/home/models/categories.dart';
import 'package:tredo/feature/home/models/offers.dart';
import 'package:tredo/feature/settings/models/profile.dart';

import 'models/sliders.dart';

class HomePageController extends GetxController {
  final AppBuilder appBuilder = Get.find();
  late final String token;
  var isLoading = false.obs;
  final RxnInt selectedCategory = RxnInt();

  ObsList<StateModel> states = ObsList([]);

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

  ObsList<Cities> cities = ObsList([]);
  var selectedState = Rxn<StateModel>();
  var selectedCity = Rxn<Cities>();

  void selectCategory(int index) {
    selectedCategory.value = index;
  }

  ObsList<Sliders> sliders = ObsList([]);
  fetchSliders() async {
    isLoading.value = true;
    ResponseModel response = await APIService.instance.request(
      Request(endPoint: EndPoints.sliders, fromJson: Sliders.fromJson),
    );

    if (response.success) {
      sliders.value = response.data;
    } else {
      sliders.error = response.message;
    }
    isLoading.value = false;
  }

  ObsVar<Profile> profile = ObsVar(null);
  fetchProfile() async {
    final token = appBuilder.token;
    debugPrint("token: $token");
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
      profile.error = null;
    } else {
      profile.error = response.message;
    }

    isLoading.value = false;
  }

  ObsList<Entites> entities = ObsList([]);
  fetchEntities() async {
    isLoading.value = true;
    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.goverment_entities,
        fromJson: Entites.fromJson,
      ),
    );

    if (response.success) {
      entities.value = response.data;
    } else {
      entities.error = response.message;
    }
    isLoading.value = false;
  }

  ObsList<Categories> categories = ObsList([]);
  fetchCategories() async {
    isLoading.value = true;
    ResponseModel response = await APIService.instance.request(
      Request(endPoint: EndPoints.categories, fromJson: Categories.fromJson),
    );

    if (response.success) {
      categories.value = response.data;
    } else {
      categories.error = response.message;
    }
    isLoading.value = false;
  }

  ObsList<Offers> offers = ObsList([]);
  fetchOffers() async {
    isLoading.value = true;
    ResponseModel response = await APIService.instance.request(
      Request(endPoint: EndPoints.offers, fromJson: Offers.fromJson),
    );

    if (response.success) {
      offers.value = response.data;
    } else {
      offers.error = response.message;
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    fetchProfile();
    fetchSliders();
    fetchEntities();
    fetchCategories();
    fetchOffers();
    super.onInit();
  }
}






