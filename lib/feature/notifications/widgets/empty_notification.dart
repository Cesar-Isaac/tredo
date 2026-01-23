import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/widgets/image.dart';


class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage(
              width: double.infinity,
              path: "assets/image/noMessages.png",
              type: ImageType.Asset,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              tr(LocaleKeys.no_messages_yet),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              tr(LocaleKeys.no_message_contain),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
