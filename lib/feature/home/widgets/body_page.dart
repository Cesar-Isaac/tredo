import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/feature/home/widgets/section_of_ministry.dart';
import 'package:tredo/feature/home/widgets/slider.dart';

import 'best_offers.dart';
import 'categories.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: ListView(
        children: [
          Text(
            tr(LocaleKeys.Lets_Find_The_Perfect_Service_Expert),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),

          SizedBox(height: 20),
          SliderPage(),
          SizedBox(height: 10),
          CategoriesSection(),
          SizedBox(height: 2),
          SectionOfMinistry(),
          SizedBox(height: 20),
          BestOffers(),
          SizedBox(height: 120),
        ],
      ),
    );
  }
}
