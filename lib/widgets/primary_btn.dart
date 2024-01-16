import 'package:flutter/material.dart';

import '../utils/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    this.child,
    required this.onPressed,
    this.backgroundColor,
    this.width,
    this.height,
    this.label,
    super.key,
  });

  final Function()? onPressed;
  final Widget? child;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width ?? 300,
      color: backgroundColor ?? Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.deepPurple.shade100, // Border color
          width: 2.0, // Border width
        ),
        borderRadius: BorderRadius.circular(8.0), // Border radius
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label ?? 'Sign up now',
                  style: TextStyle(
                      fontSize: 18, color: Colors.deepPurple.shade300),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
      ),
    );
  }
}
