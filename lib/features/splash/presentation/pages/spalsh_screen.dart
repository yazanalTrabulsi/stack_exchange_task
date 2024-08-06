import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stack_exchange_task/core/themes/colors_theme.dart';
import 'package:stack_exchange_task/features/splash/presentation/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: Image.asset('assets/logo.png'),
            ),
            backgroundColor: ThemeColor.white,
          );
        },
      ),
    );
  }
}
