import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/svg_icon.dart';
import 'package:tredo/feature/EntitiesPage/models/entites_model.dart';
import 'package:tredo/gen/assets.gen.dart';

class EntityDetailsBottomSheet extends StatelessWidget {
  final Entites entity;

  const EntityDetailsBottomSheet({super.key, required this.entity});

  static void show(BuildContext context, Entites entity) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => EntityDetailsBottomSheet(entity: entity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                entity.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () => Get.back(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                entity.socialLinks
                    .map(
                      (link) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ElevatedButton.icon(
                          onPressed: () => _launchLink(context, link),
                          icon: _getSocialIcon(link.type),
                          label: Text(
                            _getSocialLabel(link.type),
                            style: const TextStyle(
                              fontSize: 12,
                              color: StyleRepo.orange,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: StyleRepo.white,
                            foregroundColor: StyleRepo.orange,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            side: BorderSide(color: StyleRepo.orange),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _getSocialIcon(int type) {
    switch (type) {
      case 3:
        return SvgIcon(
          icon: Assets.icons.phone,
          color: StyleRepo.orange,
          size: 15,
        );
      case 1:
        return SvgIcon(
          icon: Assets.icons.facebook,
          color: StyleRepo.orange,
          size: 16,
        );
      case 2:
        return SvgIcon(
          icon: Assets.icons.instagram,
          color: StyleRepo.orange,
          size: 16,
        );
      default:
        return Icon(Icons.line_axis);
    }
  }

  String _getSocialLabel(int type) {
    switch (type) {
      case 3:
        return 'Phone';
      case 1:
        return 'Facebook';
      case 2:
        return 'Instagram';
      default:
        return 'Link';
    }
  }

  Future<void> _launchLink(BuildContext context, SocialLink link) async {
    final String value = link.value;
    Uri url;
    if (link.type == 3) {

      url = Uri(scheme: 'tel', path: value);
    } else {

      url = Uri.parse(value);
    }
  }
}
