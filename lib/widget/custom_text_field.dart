

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/constants.dart';


class CustomTextField extends StatelessWidget {


  final TextEditingController? controller;
  final String label;
  final String hint;

  final bool isPassword;
  final bool isObscureText;
  final Widget? suffixIcon;
  final Widget? icon;
  final VoidCallback? onShowPassword;
  final VoidCallback? onTab;
  final TextInputType inputType;
  final Function? onValid;
  final Function? onChange;
  final bool isEnable;
  final double cursorWidth;
  final int maxLines;
  final int minLines;
  final double borderRadius;

  CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.onValid,

    this.onChange,
    this.isPassword = false,
    this.isObscureText = false,
    this.suffixIcon,
    this.icon,
    this.onShowPassword,
    this.onTab,
    this.inputType = TextInputType.text,
    this.isEnable = true,
    this.cursorWidth = 0.0,
    this.maxLines = 1,
    this.minLines = 1,
    this.borderRadius = 18,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: TextFormField(
        onTap: onTab,
          controller: controller,
          obscureText: isObscureText,
          keyboardType: inputType,
          enabled: isEnable,
          cursorWidth: cursorWidth,
          maxLines: maxLines,
          minLines: minLines,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              contentPadding: const EdgeInsets.all(16),
              labelText: label.tr,
              labelStyle: const TextStyle(
                  fontFamily: Const.appFont,
              fontSize: 14,
              fontWeight: FontWeight.w500, color: AppColors.colorBlack),
              hintText: hint.tr,

              hintStyle: const TextStyle(
                  fontFamily: Const.appFont,
                  fontSize: 12,
                  fontWeight: FontWeight.w500, color: AppColors.colorTextMain),
              hintMaxLines: 1,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: suffixIcon!,
                      onPressed: onShowPassword)
                  : icon,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.colorAppMain),
                  borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.colorAppMain),
                  borderRadius: BorderRadius.circular(borderRadius),
                  )),
          onChanged: (newValue) => onChange!(newValue),
          validator: (value) => onValid!(value)),
    );
  }
}