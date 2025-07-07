import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/widget/custom_animation_loading.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final Color progressColor;
  final bool isLoading;

  CustomCachedImage(
      {super.key, required this.imageUrl,
        this.width = double.infinity,
        this.height = double.infinity,
        this.fit = BoxFit.cover,
        this.progressColor = AppColors.colorAppMain,
        this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        width: width,
        height: height,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        progressIndicatorBuilder: (_, imageUrl, downloaded) =>
        isLoading ? CustomAnimationLoading(color: progressColor) : Container(),
        // fadeOutCurve: Curves.,
        errorWidget: (_, imageUrl, error) => Container(
          width: width,
          height: height,
          color: Colors.white,
          child: Image.asset(
              width: width,
              height: height,
              fit: BoxFit.scaleDown,
              '${Const.logo}logo.png'),
        ));
  }

// Image(
//     width: 272.w,
//     height: 159.r,
//     image: CachedNetworkImageProvider(vendor.image), fit: BoxFit.cover),
/*Image.network(
            width: 272.w,
            height: 159.r,
            vendor.image, fit: BoxFit.cover)*/
}