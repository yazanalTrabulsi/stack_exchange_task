import 'package:dartz/dartz.dart';
import 'package:stack_exchange_task/core/error/failures.dart';
import 'package:stack_exchange_task/features/questions/domain/entities/question_entity.dart';
import 'package:stack_exchange_task/features/questions/domain/repositories/question_repository.dart';

class GetAllQuestionsUsecase {
  final QuestionRepository repository;

  GetAllQuestionsUsecase({required this.repository});

  Future<Either<Failure, List<QuestionEntity>>> call(int page, int pageSize) async {
    return await repository.getAllQuestions(page, pageSize);
  }
}
