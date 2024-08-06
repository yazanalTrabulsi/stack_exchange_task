import 'package:get/get.dart';
import 'package:stack_exchange_task/features/questions/domain/usecases/get_all_questions.dart';
import 'package:stack_exchange_task/features/questions/presentation/controllers/question_controller.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => QuestionController(
          getAllQuestions: Get.find<GetAllQuestionsUsecase>()),
    );
  }
}
