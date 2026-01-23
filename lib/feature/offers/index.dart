import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/core/widgets/image.dart';
import 'package:tredo/feature/offers/controller.dart';
import 'package:tredo/feature/offers/widgets/grid_offers.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersPageController());
    return Scaffold(
      body: Stack(
        children: [
          AppImage(
            width: double.infinity,
            path: "assets/image/HeaderBackground.png",
            type: ImageType.Asset,
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  tr(LocaleKeys.offers_list),
                  style: TextStyle(
                    color: StyleRepo.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: const GridOffers(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
