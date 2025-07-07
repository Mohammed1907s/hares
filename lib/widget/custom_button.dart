import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? background;
  final FontWeight? fontWeight;
  final String label;
  final bool isUpperCase;
  final Color textColor;
  final double textSize;
  final Widget? leading;
  final double radius;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isUpperCase = false,
    this.background = AppColors.colorAppMain,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.w500,
    this.textSize = 16.0,
    this.leading,
    this.radius = 18,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          backgroundColor: background,
          padding: const EdgeInsets.all(16)),
      onPressed: onPressed,
      child: Center(
          child: leading == null
              ? AppText.medium(
                  fontSize: textSize,
                  color: textColor,
                  text: isUpperCase ? label.tr.toUpperCase() : label.tr,
                  fontWeight: fontWeight!)
              : Row(
                  children: [
                    Expanded(
                      child: AppText.medium(
                          fontSize: textSize,
                          color: textColor,
                          text: isUpperCase ? label.tr.toUpperCase() : label.tr,
                          fontWeight: fontWeight!),
                    ),
                    leading ?? Container()
                  ],
                )),
    );
  }
}
