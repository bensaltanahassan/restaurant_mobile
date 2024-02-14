import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.controller,
    this.isPassword = false,
    this.suffixIcon,
    this.initialValue,
    this.keyboardType,
    this.borderColor = AppColors.secondColor,
    this.fontColor,
    this.validator,
  });

  final Color? fontColor;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool isPassword;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextInputType? keyboardType;
  final Color borderColor;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      initialValue: initialValue,
      obscureText: isPassword,
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: AppColors.secondColor),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: fontColor ?? Colors.white),
        hintStyle: TextStyle(color: fontColor ?? Colors.white),
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: Colors.white) : null,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10).r,
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)).r,
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)).r,
          borderSide: BorderSide(color: borderColor),
        ),
      ),
    );
  }
}
