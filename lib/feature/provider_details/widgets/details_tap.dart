import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/feature/provider_details/controller.dart';
import 'package:tredo/feature/provider_details/widgets/contact_button.dart';

class DetailsTab extends StatelessWidget {
  const DetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProviderDatailsController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          Text(
            tr(LocaleKeys.description),
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            controller.provider.description,
            style: TextStyle(
              color: StyleRepo.grey,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 5,
            runSpacing: 1,
            children:
                controller.provider.tags.map<Widget>((tag) {
                  return Container(
                    width: 95,
                    height: 36,
                    decoration: BoxDecoration(
                      color: StyleRepo.foundation,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        '#${tag.name}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 20),
          Text(
            tr(LocaleKeys.contact_details),
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              ContactButton(icon: Icons.phone, label: "Phone Number"),
              ContactButton(icon: Icons.phone, label: "WhatsApp"),
              ContactButton(icon: Icons.facebook, label: "Facebook"),
              ContactButton(icon: Icons.camera_alt, label: "Instagram"),
            ],
          ),
        ],
      ),
    );
  }
}
