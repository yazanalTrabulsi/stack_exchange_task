import 'package:dartz/dartz.dart';
import 'package:stack_exchange_task/core/network/network_info.dart';
import 'package:stack_exchange_task/features/questions/domain/entities/question_entity.dart';
import 'package:stack_exchange_task/features/questions/domain/repositories/question_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

import '../datasources/question_local_data_source.dart';
import '../datasources/question_remote_data_source.dart';

class QuestionsRepositoryImpl implements QuestionRepository {
  final QuestionRemoteDataSource remoteDataSource;
  final QuestionLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  QuestionsRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<QuestionEntity>>> getAllQuestions(
      page, pageSize) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteQuestions =
            await remoteDataSource.getAllQuestions(page, pageSize);
        try {
          await localDataSource.cacheQuestions(remoteQuestions);
        } catch (e) {
          print(e);
        }
        return Right(remoteQuestions);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localQuestions =
            await localDataSource.getCachedQuestions(page, pageSize);
        return Right(localQuestions);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
