import "package:flutter/material.dart";
import "package:gap/gap.dart";
import 'package:laura/utils/theme.dart';

class AppTextField extends StatelessWidget {
  final String? labelText, prefixText;
  final String? initialValue;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String? input)? validator;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  final bool withBorder, withBottomInset, enabled;
  final FloatingLabelBehavior floatingLabelBehavior;

  const AppTextField({
    Key? key,
    this.labelText,
    this.prefixText,
    this.initialValue,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.hintText,
    this.errorText,
    this.controller,
    this.obscureText = false,
    this.textCapitalization,
    this.withBorder = true,
    this.withBottomInset = true,
    this.enabled = true,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          enabled: enabled,
          controller: controller,
          obscureText: obscureText,
          initialValue: initialValue,
          keyboardType: keyboardType,
          validator: validator,
          style: AppStyles.general(14, FontWeight.w400, color: Colors.black),
          cursorColor: AppColors.primaryColor,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          decoration: InputDecoration(
            filled: true,
            floatingLabelBehavior: floatingLabelBehavior,
            fillColor: Colors.white,
            labelText: labelText,
            prefixText: prefixText,
            suffixIcon: suffixIcon,
            suffixIconColor: AppColors.secondrayColor,
            hintText: hintText,
            errorText: errorText,
            errorStyle:
                AppStyles.general(12, FontWeight.w400, color: AppColors.error),
            hintStyle:
                AppStyles.general(12, FontWeight.w400, color: Colors.black),
            labelStyle: AppStyles.general(12, FontWeight.w400,
                color: AppColors.primaryColor),
          ),
        ),
        if (withBottomInset) const Gap(16),
      ],
    );
  }
}
