import 'package:flutter/material.dart';
import 'package:mindwell/shared_utils/styles/colors.dart';
class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    this.borderRadius,
   required this.link,
    this.width,
    this.height, this.fit,
  });
  final double? borderRadius;
  final String? link;
  final double? width;
  final double? height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
     borderRadius: BorderRadius.circular(borderRadius ?? 15),
      child: link != null
          ?
      FadeInImage.assetNetwork(
        fit: fit,
        image: link!,
        width: width ?? 30,
        height: height ?? 30,
        fadeInDuration: const Duration(milliseconds: 300),
        placeholder:'assets/download_image.gif',

      )

          : Container(
        width: width ?? 30,
        height: height ?? 30,
        decoration: const BoxDecoration(
          color: ColorsAsset.kBrown,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}
