
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../core/config/app_builder.dart';
import '../../core/services/pagination/controller.dart';
import '../../core/services/rest_api/api_service.dart';
import '../../core/services/rest_api/constants/end_points.dart';
import '../../core/services/rest_api/models/request.dart';
import '../../core/services/rest_api/models/response_model.dart';

class ProvidersController extends GetxController {
  final AppBuilder appBuilder = Get.find();

  var isLoading = false.obs;
  PaginationController? pagerController;
  Timer? _debounce;
  String searchQuery = '';

  var selectedCategoryId = RxnInt();

  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchQuery = value.trim().toLowerCase();
      refreshData();
    });
  }

  void changeCategory(int? id) {
    selectedCategoryId.value = id;
    pagerController?.refreshData();
  }

  Future<ResponseModel> fetchProviders(int page, CancelToken cancel) async {
    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.providers,
        params: {
          "page": page,
          if (searchQuery.isNotEmpty) "provider_name": searchQuery,
          if (selectedCategoryId.value != null)
            "category_id": selectedCategoryId.value,
        },
        cancelToken: cancel,
      ),
    );
    return response;
  }

  void refreshData() {
    pagerController?.refreshData();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }
}
