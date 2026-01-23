import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:tredo/core/localization/strings.dart';
import 'package:tredo/feature/provider_details/widgets/slider.dart';

class GalleryTab extends StatelessWidget {
  const GalleryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr(LocaleKeys.gallery),
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 15),
          SliderOfferPage(),
        ],
      ),
    );
  }
}
