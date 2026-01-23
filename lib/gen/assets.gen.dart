// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/aboutUs.svg
  SvgGenImage get aboutUs => const SvgGenImage('assets/icons/aboutUs.svg');

  /// File path: assets/icons/city.svg
  SvgGenImage get city => const SvgGenImage('assets/icons/city.svg');

  /// File path: assets/icons/contact (2).svg
  SvgGenImage get contact2 => const SvgGenImage('assets/icons/contact (2).svg');

  /// File path: assets/icons/description.svg
  SvgGenImage get description =>
      const SvgGenImage('assets/icons/description.svg');

  /// File path: assets/icons/edit.svg
  SvgGenImage get edit => const SvgGenImage('assets/icons/edit.svg');

  /// File path: assets/icons/entities.svg
  SvgGenImage get entities => const SvgGenImage('assets/icons/entities.svg');

  /// File path: assets/icons/facebook.svg
  SvgGenImage get facebook => const SvgGenImage('assets/icons/facebook.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/instagram.svg
  SvgGenImage get instagram => const SvgGenImage('assets/icons/instagram.svg');

  /// File path: assets/icons/invisible.svg
  SvgGenImage get invisible => const SvgGenImage('assets/icons/invisible.svg');

  /// File path: assets/icons/language.svg
  SvgGenImage get language => const SvgGenImage('assets/icons/language.svg');

  /// File path: assets/icons/lock.svg
  SvgGenImage get lock => const SvgGenImage('assets/icons/lock.svg');

  /// File path: assets/icons/noMessages.svg
  SvgGenImage get noMessages =>
      const SvgGenImage('assets/icons/noMessages.svg');

  /// File path: assets/icons/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/icons/notification.svg');

  /// File path: assets/icons/offers.svg
  SvgGenImage get offers => const SvgGenImage('assets/icons/offers.svg');

  /// File path: assets/icons/phone.svg
  SvgGenImage get phone => const SvgGenImage('assets/icons/phone.svg');

  /// File path: assets/icons/phone_outline.svg
  SvgGenImage get phoneOutline =>
      const SvgGenImage('assets/icons/phone_outline.svg');

  /// File path: assets/icons/privacy (2).svg
  SvgGenImage get privacy2 => const SvgGenImage('assets/icons/privacy (2).svg');

  /// File path: assets/icons/provider.svg
  SvgGenImage get provider => const SvgGenImage('assets/icons/provider.svg');

  /// File path: assets/icons/providers.svg
  SvgGenImage get providers => const SvgGenImage('assets/icons/providers.svg');

  /// File path: assets/icons/settings.svg
  SvgGenImage get settings => const SvgGenImage('assets/icons/settings.svg');

  /// File path: assets/icons/settings_slider.svg
  SvgGenImage get settingsSlider =>
      const SvgGenImage('assets/icons/settings_slider.svg');

  /// File path: assets/icons/state.svg
  SvgGenImage get state => const SvgGenImage('assets/icons/state.svg');

  /// File path: assets/icons/user.svg
  SvgGenImage get user => const SvgGenImage('assets/icons/user.svg');

  /// File path: assets/icons/visible.svg
  SvgGenImage get visible => const SvgGenImage('assets/icons/visible.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    aboutUs,
    city,
    contact2,
    description,
    edit,
    entities,
    facebook,
    home,
    instagram,
    invisible,
    language,
    lock,
    noMessages,
    notification,
    offers,
    phone,
    phoneOutline,
    privacy2,
    provider,
    providers,
    settings,
    settingsSlider,
    state,
    user,
    visible,
  ];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/Ellipse 1 (1).png
  AssetGenImage get ellipse11 =>
      const AssetGenImage('assets/image/Ellipse 1 (1).png');

  /// File path: assets/image/Frame.png
  AssetGenImage get frame => const AssetGenImage('assets/image/Frame.png');

  /// File path: assets/image/Frame2.png
  AssetGenImage get frame2 => const AssetGenImage('assets/image/Frame2.png');

  /// File path: assets/image/HeaderBackground.png
  AssetGenImage get headerBackground =>
      const AssetGenImage('assets/image/HeaderBackground.png');

  /// File path: assets/image/serviceProvider.png
  AssetGenImage get serviceProvider =>
      const AssetGenImage('assets/image/serviceProvider.png');

  /// File path: assets/image/splashScreen.jpg
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/image/splashScreen.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
    ellipse11,
    frame,
    frame2,
    headerBackground,
    serviceProvider,
    splashScreen,
  ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar.json
  String get ar => 'assets/translations/ar.json';

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImageGen image = $AssetsImageGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
