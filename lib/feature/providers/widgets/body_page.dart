import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/svg_icon.dart';
import 'package:tredo/feature/providers/controller.dart';
import 'package:tredo/gen/assets.gen.dart';

import 'card_service.dart';

class ListProviders extends StatelessWidget {
  const ListProviders({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProvidersController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            onChanged: controller.onSearchChanged,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgIcon(
                  icon: Assets.icons.settingsSlider,
                  color: StyleRepo.grey,
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              prefixIcon: Icon(Icons.search, color: StyleRepo.grey),
              hintText: tr(LocaleKeys.search),
            ),
          ),
        ),
        Expanded(child: CardService()),
      ],
    );
  }
}
