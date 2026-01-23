import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tredo/core/services/pagination/controller.dart';
import 'package:tredo/core/services/rest_api/api_service.dart';
import 'package:tredo/core/services/rest_api/constants/end_points.dart';
import 'package:tredo/core/services/rest_api/models/request.dart';
import 'package:tredo/core/services/rest_api/models/response_model.dart';

class EntitiesPageController extends GetxController {
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

  Future<ResponseModel> fetchEntities(int page, CancelToken cancel) async {
    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.goverment_entities,
        params: {"page": page, if (searchQuery.isNotEmpty) "name": searchQuery},
        cancelToken: cancel,
      ),
    );
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
