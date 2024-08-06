import 'package:dartz/dartz.dart';
import 'package:stack_exchange_task/core/error/failures.dart';
import 'package:stack_exchange_task/features/questions/domain/entities/question_entity.dart';

abstract class QuestionRepository {
  Future<Either<Failure, List<QuestionEntity>>> getAllQuestions(page, pageSize);
}
