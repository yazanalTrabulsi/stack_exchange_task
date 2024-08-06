import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:stack_exchange_task/core/strings/failures.dart';
import 'package:stack_exchange_task/features/questions/domain/entities/question_entity.dart';
import 'package:stack_exchange_task/features/questions/domain/usecases/get_all_questions.dart';
import 'package:stack_exchange_task/core/error/failures.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class QuestionController extends GetxController {
  final GetAllQuestionsUsecase getAllQuestions;
  static const _pageSize = 20;
  final PagingController<int, QuestionEntity> pagingController =
      PagingController(firstPageKey: 1);

  QuestionController({required this.getAllQuestions});

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      _loadQuestions(pageKey);
    });
  }

  Future<void> _loadQuestions(int pageKey) async {
    final Either<Failure, List<QuestionEntity>> res =
        await getAllQuestions(pageKey, _pageSize);
    res.fold(
      (failure) {
        pagingController.error = _mapFailureToMessage(failure);
      },
      (questionList) {
        final isLastPage = questionList.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(questionList);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(questionList, nextPageKey);
        }
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later.";
    }
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
