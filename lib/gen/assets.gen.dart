/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/blueheart.png
  AssetGenImage get blueheart =>
      const AssetGenImage('assets/images/blueheart.png');

  /// File path: assets/images/bodycomposition.png
  AssetGenImage get bodycomposition =>
      const AssetGenImage('assets/images/bodycomposition.png');

  /// File path: assets/images/canceropinion.png
  AssetGenImage get canceropinion =>
      const AssetGenImage('assets/images/canceropinion.png');

  /// File path: assets/images/fitness_assessment.png
  AssetGenImage get fitnessAssessment =>
      const AssetGenImage('assets/images/fitness_assessment.png');

  /// File path: assets/images/fitnessicon.png
  AssetGenImage get fitnessicon =>
      const AssetGenImage('assets/images/fitnessicon.png');

  /// File path: assets/images/health_assessment.png
  AssetGenImage get healthAssessment =>
      const AssetGenImage('assets/images/health_assessment.png');

  /// File path: assets/images/healthriskman.png
  AssetGenImage get healthriskman =>
      const AssetGenImage('assets/images/healthriskman.png');

  /// File path: assets/images/instantreport.png
  AssetGenImage get instantreport =>
      const AssetGenImage('assets/images/instantreport.png');

  /// File path: assets/images/knee.png
  AssetGenImage get knee => const AssetGenImage('assets/images/knee.png');

  /// File path: assets/images/ladypushup.png
  AssetGenImage get ladypushup =>
      const AssetGenImage('assets/images/ladypushup.png');

  /// File path: assets/images/ladyworkout.png
  AssetGenImage get ladyworkout =>
      const AssetGenImage('assets/images/ladyworkout.png');

  /// File path: assets/images/loginbottom.png
  AssetGenImage get loginbottom =>
      const AssetGenImage('assets/images/loginbottom.png');

  /// File path: assets/images/loginbottom_removebg.png
  AssetGenImage get loginbottomRemovebg =>
      const AssetGenImage('assets/images/loginbottom_removebg.png');

  /// File path: assets/images/maleworkout.png
  AssetGenImage get maleworkout =>
      const AssetGenImage('assets/images/maleworkout.png');

  /// File path: assets/images/manworkout.png
  AssetGenImage get manworkout =>
      const AssetGenImage('assets/images/manworkout.png');

  /// File path: assets/images/physio.png
  AssetGenImage get physio => const AssetGenImage('assets/images/physio.png');

  /// File path: assets/images/posteranalysis.png
  AssetGenImage get posteranalysis =>
      const AssetGenImage('assets/images/posteranalysis.png');

  /// File path: assets/images/pushups.png
  AssetGenImage get pushups => const AssetGenImage('assets/images/pushups.png');

  /// File path: assets/images/squats.png
  AssetGenImage get squats => const AssetGenImage('assets/images/squats.png');

  /// File path: assets/images/uk_flag.png
  AssetGenImage get ukFlag => const AssetGenImage('assets/images/uk_flag.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    blueheart,
    bodycomposition,
    canceropinion,
    fitnessAssessment,
    fitnessicon,
    healthAssessment,
    healthriskman,
    instantreport,
    knee,
    ladypushup,
    ladyworkout,
    loginbottom,
    loginbottomRemovebg,
    maleworkout,
    manworkout,
    physio,
    posteranalysis,
    pushups,
    squats,
    ukFlag,
  ];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/allycare.png
  AssetGenImage get allycare => const AssetGenImage('assets/logo/allycare.png');

  /// File path: assets/logo/support.png
  AssetGenImage get support => const AssetGenImage('assets/logo/support.png');

  /// List of all assets
  List<AssetGenImage> get values => [allycare, support];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/complete_lottie.json
  String get completeLottie => 'assets/lottie/complete_lottie.json';

  /// File path: assets/lottie/loader.json
  String get loader => 'assets/lottie/loader.json';

  /// List of all assets
  List<String> get values => [completeLottie, loader];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
