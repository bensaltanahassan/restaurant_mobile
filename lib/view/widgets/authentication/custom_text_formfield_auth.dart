import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  const CustomTextFormFieldAuth({
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
  });

  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool isPassword;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextInputType? keyboardType;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: isPassword,
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: Colors.white) : null,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: borderColor),
        ),
      ),
    );
  }
}
