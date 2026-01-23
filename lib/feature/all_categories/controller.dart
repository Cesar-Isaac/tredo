import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tredo/core/services/pagination/controller.dart';
import 'package:tredo/core/services/rest_api/api_service.dart';
import 'package:tredo/core/services/rest_api/constants/end_points.dart';
import 'package:tredo/core/services/rest_api/models/request.dart';
import 'package:tredo/core/services/rest_api/models/response_model.dart';
import 'package:tredo/feature/home/models/categories.dart';

class AllCategoriesController extends GetxController {

  final RxnInt selectedCategory = RxnInt();


  final isLoading = false.obs;

  /// Pagination Controller
  PaginationController? pagerController;


  final RxList<Categories> categories = <Categories>[].obs;


  final RxString searchQuery = ''.obs;

  /// Debouncer
  Timer? _debounce;

  /// ================= FETCH =================
  Future<ResponseModel> fetchCategories(int page, CancelToken cancel) async {
    isLoading.value = true;

    try {
      final ResponseModel response = await APIService.instance.request(
        Request(
          endPoint: EndPoints.categories,
          params: {
            "page": page,
            if (searchQuery.value.isNotEmpty)
              "name": searchQuery.value,
          },
          cancelToken: cancel,
        ),
      );

      final List data = response.data as List? ?? [];
      final loadedCategories = data.map((e) => Categories.fromJson(e)).toList();

      if (page == 1) {
        categories.assignAll(loadedCategories);
      } else {
        categories.addAll(loadedCategories);
      }

      isLoading.value = false;
      return response;
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  /// ================= SEARCH WITH DEBOUNCE =================
  void onSearchChanged(String value) {
    searchQuery.value = value.toLowerCase().trim();

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      pagerController?.refreshData();
    });
  }

  /// ================= REFRESH =================
  Future<void> refreshData() async {
    selectedCategory.value = null;
    pagerController?.refreshData();
  }

  /// ================= SELECT =================
  void selectCategory(int index) {
    selectedCategory.value = selectedCategory.value == index ? null : index;
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }
}
