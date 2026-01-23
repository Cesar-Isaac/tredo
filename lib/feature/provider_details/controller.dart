import 'package:get/get.dart';
import 'package:tredo/core/services/state_management/obs.dart';
import 'package:tredo/feature/providers/models/providers.dart';

class ProviderDatailsController extends GetxController{
   var currentTab = 0.obs; 
   late final ServiceProviders provider;
   ObsList<ServiceProviders> providerDetails = ObsList([]);
    @override
  void onInit() {
    super.onInit();
    provider = Get.arguments as ServiceProviders; 
  }

  void changeTab(int index) {
    currentTab.value = index;
  }

}