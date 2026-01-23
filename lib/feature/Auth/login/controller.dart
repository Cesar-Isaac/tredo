import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tredo/core/config/app_builder.dart';
import 'package:tredo/core/config/role.dart';
import 'package:tredo/core/routes/routes.dart';
import 'package:tredo/core/services/rest_api/api_service.dart';
import 'package:tredo/core/services/rest_api/constants/end_points.dart';
import 'package:tredo/core/services/rest_api/models/request.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/feature/Auth/widgets/const.dart';

class LoginPageController extends GetxController {
  final AppBuilder appBuilder = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController phone, password;
  final obscurePassword = true.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> confirm() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    final response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.login,
        method: RequestMethod.Post,
        body: {"phone": phone.text, "password": password.text},
      ),
    );

    isLoading.value = false;


    debugPrint('[DEBUG] response.success: ${response.success}');
    debugPrint('[DEBUG] response.data raw: ${response.data}');

    if (!response.success) {
      Get.snackbar(
        "Error",
        response.message ?? "Unknown error",
        snackPosition: SnackPosition.TOP,
        backgroundColor: StyleRepo.red,
        colorText: StyleRepo.white,
      );
      return;
    }


    final dynamic raw = response.data;
    Map<String, dynamic> map;
    if (raw is Map) {
      map = Map<String, dynamic>.from(raw);
    } else {

      debugPrint('[DEBUG] response.data is not a Map: ${raw.runtimeType}');
      map = {};
    }

    //  verified و user
    final dynamic inner = map['data'] ?? map;
    debugPrint('[DEBUG] inner (map["data"]): $inner');


    bool parseBool(dynamic v) {
      if (v == null) return false;
      if (v is bool) return v;
      if (v is String) {
        final s = v.trim().toLowerCase();
        if (s == 'true') return true;
        if (s == 'false') return false;
        //  "0"/"1"
        if (s == '1') return true;
        if (s == '0') return false;
      }
      if (v is int) return v != 0;
      return false;
    }

    final bool verified =
        (inner is Map && inner.containsKey('verified'))
            ? parseBool(inner['verified'])
            : parseBool(map['verified']);

    debugPrint('[DEBUG] parsed verified = $verified');

    if (verified == false) {
      debugPrint('[DEBUG] Navigating to verify page because verified == false');
      Get.offNamed(
        Pages.verifiy.value,
        arguments: {"phone": phone.text, "purpose": Purpose.login},
      );
      
      return;
    }

    
    final String? token =
        (map['token'] as String?) ??
        (inner is Map ? inner['token'] as String? : null);

    if (token == null || token.isEmpty) {
      debugPrint('[DEBUG] token is null or empty -> do not navigate to main');
      
      Get.snackbar(
        "Error",
        "No token returned from server.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: StyleRepo.red,
        colorText: StyleRepo.white,
      );
      return;
    }


    appBuilder.setRole(Role.user);
    appBuilder.setToken(token);
    appBuilder.box.write("isLoggedIn", true);
    appBuilder.box.write("token", token);

    debugPrint('[DEBUG] Navigating to main with token: $token');
    Get.offAllNamed(Pages.main.value);
  }

  @override
  void onInit() {
    phone = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    phone.dispose();
    password.dispose();

    super.onClose();
  }
}
