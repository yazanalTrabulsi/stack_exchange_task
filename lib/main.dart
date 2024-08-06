import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stack_exchange_task/core/routes/app_pages.dart';
import 'package:stack_exchange_task/core/themes/colors_theme.dart';
import 'package:stack_exchange_task/core/util/database_helper.dart';
import 'package:stack_exchange_task/features/splash/presentation/pages/spalsh_screen.dart';

import 'features/splash/presentation/bindings/splash_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DatabaseHelper());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stack Exchange Task',
      theme: ThemeColor().themeData,
      home: const SplashScreen(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
