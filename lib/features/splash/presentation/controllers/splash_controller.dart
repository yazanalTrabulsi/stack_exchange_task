import 'package:get/get.dart';

import '../../../../core/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      Get.offNamed(AppRoutes.question, arguments: {});
    });
  }
}
