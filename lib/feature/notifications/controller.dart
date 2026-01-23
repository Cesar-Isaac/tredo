import 'package:get/get.dart';
import 'package:tredo/core/config/app_builder.dart';
import 'package:tredo/core/services/rest_api/api_service.dart';
import 'package:tredo/core/services/rest_api/constants/end_points.dart';
import 'package:tredo/core/services/rest_api/models/request.dart';
import 'package:tredo/feature/notifications/models/notification.dart';

class NotificationsController extends GetxController {
  final AppBuilder appBuilder = Get.find();
  late final String token;

  final notifications = <NotificationModel>[].obs;
  final isLoading = false.obs;
  final unreadCount = 0.obs;

  @override
  void onInit() {
    token = appBuilder.token.toString();
    fetchNotifications();
    super.onInit();
  }

  Future<void> fetchNotifications() async {
    isLoading.value = true;

    final response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.notifications,
        method: RequestMethod.Get,
        header: {"Authorization": "Bearer $token"},
      ),
    );

    if (response.success) {
      //  NotificationModel
      notifications.value = (response.data as List)
          .map((e) => NotificationModel.fromJson(e))
          .toList();


      unreadCount.value = notifications.where((n) => !n.isRead).length;
    }

    isLoading.value = false;
  }

  void markAsRead(String id) {
    final index = notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      final updated = notifications[index].copyWith(readAt: DateTime.now());
      notifications[index] = updated;
      unreadCount.value = notifications.where((n) => !n.isRead).length;
    }
  }
}
