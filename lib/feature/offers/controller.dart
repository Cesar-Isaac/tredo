import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tredo/core/services/pagination/controller.dart';
import 'package:tredo/core/services/rest_api/api_service.dart';
import 'package:tredo/core/services/rest_api/constants/end_points.dart';
import 'package:tredo/core/services/rest_api/models/request.dart';
import 'package:tredo/core/services/rest_api/models/response_model.dart';
import 'package:tredo/feature/home/models/offers.dart';

class OffersPageController extends GetxController {
  var isLoading = false.obs;
  late PaginationController pagerController;
  Timer? _debounce;
  String searchQuery = '';
  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchQuery = value.trim().toLowerCase();
      pagerController.refreshData();
    });
  }

  Future<ResponseModel> fetchOffers(int page, CancelToken cancel) async {
    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.offers,
        params: {
          "page": page,
          if (searchQuery.isNotEmpty) "provider_name": searchQuery,
        },
        cancelToken: cancel,
      ),
    );
      if (response.success && response.data != null && searchQuery.isNotEmpty) {
      final List<dynamic> allOffers = response.data as List<dynamic>;
      final filtered = allOffers.where((offerJson) {
        final offer = Offers.fromJson(offerJson);
        return offer.title.toLowerCase().contains(searchQuery);
      }).toList();

      return ResponseModel(
        success: true,
        message: response.message,
        data: filtered,
      );
    }
    return response;
  }

  refreshData() {
    pagerController.refreshData();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }
}
