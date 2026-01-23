import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/core/style/repo.dart';
import 'package:tredo/feature/main/controller.dart';
import 'package:tredo/gen/assets.gen.dart';
import '../../../core/localization/strings.dart';

class CustomNavBar extends StatelessWidget {
  final List<SvgGenImage> _icons = [
    Assets.icons.home,
    Assets.icons.offers,
    Assets.icons.providers,
    Assets.icons.entities,
    Assets.icons.settings,
  ];

  final List<String> _labels = [
    tr(LocaleKeys.Home),
    tr(LocaleKeys.Offers),
    tr(LocaleKeys.Providers),
    tr(LocaleKeys.Entities),
    tr(LocaleKeys.Settings),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainPageController>();
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 83,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// backgrounde + radius
          Obx(
            () => CustomPaint(
              size: Size(size.width, 90),
              painter: CustomPainterNav(controller.currentX.value),
            ),
          ),

          /// Icons
          Center(
            heightFactor: 0.6,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(_icons.length, (index) {
                  final isSelected = controller.currentPage.value == index;
                  return GestureDetector(
                    onTap: () => controller.onTap(index),
                    child: Column(
                      key: controller.iconKeys[index],
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        isSelected ? SizedBox.shrink() : SizedBox(height: 20),

                        Transform.translate(
                          offset: Offset(0, isSelected ? -20.0 : 0.0),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? StyleRepo.orange
                                      : Colors.transparent,
                              shape: BoxShape.circle,
                              boxShadow:
                                  isSelected
                                      ? [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 8,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]
                                      : null,
                            ),
                            child: _icons[index].svg(
                              width: 28,
                              height: 28,
                              colorFilter: ColorFilter.mode(
                                isSelected ? Colors.white : StyleRepo.grey,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 3.0),
                        if (isSelected)
                          Text(
                            _labels[index],
                            style: TextStyle(
                              fontSize: 12.0,
                              color: StyleRepo.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPainterNav extends CustomPainter {
  final double centerX;

  CustomPainterNav(this.centerX);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = StyleRepo.deepGreen
          ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(0, 0);

    // dynamic radius arround centerX
    path.lineTo(centerX - 45, 0);
    path.quadraticBezierTo(centerX - 30, 0, centerX - 20, 25);
    path.arcToPoint(
      Offset(centerX + 20, 25),
      radius: const Radius.circular(25),
      clockwise: false,
    );
    path.quadraticBezierTo(centerX + 30, 0, centerX + 45, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // shadow of radius
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
