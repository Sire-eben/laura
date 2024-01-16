import 'package:flutter/material.dart';
import 'package:laura/utils/theme.dart';
import 'package:laura/utils/extension.dart';

import 'auth/signup_screen.dart';

class BubbleScreen extends StatefulWidget {
  const BubbleScreen({super.key});

  @override
  State<BubbleScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<BubbleScreen> {
  initializeApp() async {
    Future.delayed(const Duration(seconds: 3), () async {
      context.push(SignupScreen());
    });
  }

  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        body: Container(
          width: context.width,
          height: context.height,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 16,
              ),
              child: Image.asset(
                "assets/lc.png",
                width: context.getWidth(.35),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
