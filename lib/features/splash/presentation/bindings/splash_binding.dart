import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_exchange_task/core/network/network_info.dart';
import 'package:stack_exchange_task/core/util/database_helper.dart';
import 'package:stack_exchange_task/features/questions/data/datasources/question_local_data_source.dart';
import 'package:stack_exchange_task/features/questions/data/datasources/question_remote_data_source.dart';
import 'package:stack_exchange_task/features/questions/data/repositories/questions_repository_impl.dart';
import 'package:stack_exchange_task/features/questions/domain/repositories/question_repository.dart';
import 'package:stack_exchange_task/features/questions/domain/usecases/get_all_questions.dart';
import 'package:stack_exchange_task/features/questions/presentation/controllers/question_controller.dart';
import 'package:stack_exchange_task/features/splash/presentation/controllers/splash_controller.dart';
import 'package:http/http.dart' as http;

class SplashBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => SplashController());

    Get.lazyPut<http.Client>(() => http.Client());

    final sharedPreferences = await SharedPreferences.getInstance();
    Get.put<SharedPreferences>(sharedPreferences);

    Get.lazyPut<InternetConnectionChecker>(() => InternetConnectionChecker());

    Get.lazyPut<QuestionRemoteDataSource>(
        () => QuestionRemoteDataSourceImpl(client: Get.find<http.Client>()));

    Get.lazyPut<QuestionLocalDataSource>(() => QuestionLocalDataSourceImpl(
        databaseHelper: Get.find<DatabaseHelper>()));

    Get.lazyPut<NetworkInfo>(
        () => NetworkInfoImpl(Get.find<InternetConnectionChecker>()));

    Get.lazyPut<QuestionRepository>(
      () => QuestionsRepositoryImpl(
        remoteDataSource: Get.find<QuestionRemoteDataSource>(),
        localDataSource: Get.find<QuestionLocalDataSource>(),
        networkInfo: Get.find<NetworkInfo>(),
      ),
    );

    Get.lazyPut<GetAllQuestionsUsecase>(
      () => GetAllQuestionsUsecase(
        repository: Get.find<QuestionRepository>(),
      ),
    );

    Get.lazyPut<QuestionController>(
      () => QuestionController(
        getAllQuestions: Get.find<GetAllQuestionsUsecase>(),
      ),
    );
  }
}
