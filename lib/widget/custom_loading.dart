import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hares/widget/custom_animation_loading.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: const AlertDialog(
            backgroundColor: Colors.transparent,
            title: CustomAnimationLoading(width: 40, height: 40, size: 50)));
  }
}