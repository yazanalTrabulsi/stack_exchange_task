import 'package:get/get.dart';
import 'package:stack_exchange_task/features/answers/presentation/bindings/answer_binding.dart';
import 'package:stack_exchange_task/features/answers/presentation/pages/answer_screen.dart';
import 'package:stack_exchange_task/features/questions/presentation/bindings/question_binding.dart';
import 'package:stack_exchange_task/features/questions/presentation/pages/question_screen.dart';
import 'package:stack_exchange_task/features/splash/presentation/bindings/splash_binding.dart';
import 'package:stack_exchange_task/features/splash/presentation/pages/spalsh_screen.dart';

import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
      name: AppRoutes.question,
      page: () =>  QuestionsScreen(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: AppRoutes.answer,
      page: () => const AnswerScreen(),
      binding: AnswerBinding(),
    ),
  ];
}
