import 'package:dartz/dartz.dart';
import 'package:stack_exchange_task/core/error/exceptions.dart';
import 'package:stack_exchange_task/core/util/database_helper.dart';
import 'package:stack_exchange_task/features/questions/data/models/question_model.dart';

abstract class QuestionLocalDataSource {
  Future<List<QuestionModel>> getCachedQuestions(int page, int pageSize);

  Future<Unit> cacheQuestions(List<QuestionModel> questionsModels);
}

class QuestionLocalDataSourceImpl implements QuestionLocalDataSource {
  final DatabaseHelper databaseHelper;

  QuestionLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<Unit> cacheQuestions(List<QuestionModel> questionModels) async {
    await databaseHelper.deleteAll(); // Clear old data
    for (var model in questionModels) {
      await databaseHelper.insert(model);
    }
    return Future.value(unit);
  }

  @override
  Future<List<QuestionModel>> getCachedQuestions(int page, int pageSize) async {
    final allQuestions = await databaseHelper.queryAll();

    final int startIndex = (page - 1) * pageSize;
    final int endIndex = startIndex + pageSize;

    // Check if startIndex is within bounds
    if (startIndex >= allQuestions.length) {
      return [];
    }

    return allQuestions.sublist(startIndex,
        endIndex > allQuestions.length ? allQuestions.length : endIndex);
  }
}
