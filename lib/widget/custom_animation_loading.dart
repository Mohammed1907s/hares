
import 'package:flutter/material.dart';
import 'package:hares/utils/app_color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomAnimationLoading extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final double paddingVertical;
  final double allMargin;

  const CustomAnimationLoading(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.size = 20,
      this.color = AppColors.colorWhite,
        this.paddingVertical = 20,
        this.allMargin = 8
      });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: paddingVertical),
        padding: EdgeInsets.all(allMargin),
        width: width,
        height: height,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(14)
        ),
        child: LoadingAnimationWidget.fourRotatingDots(color: color, size: size));
  }
}
