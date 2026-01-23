
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/feature/notifications/controller.dart';

import 'empty_notification.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NotificationsController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.notifications.isEmpty) {
        return EmptyNotifications();
      }

      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: controller.notifications.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = controller.notifications[index];

          return Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              title: Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  item.body,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              trailing: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.isRead ? Colors.grey : Colors.orange,
                ),
              ),
              onTap: () {
                if (!item.isRead) {
                  controller.markAsRead(item.id);
                }
              },
            ),
          );
        },
      );
    });
  }
}
