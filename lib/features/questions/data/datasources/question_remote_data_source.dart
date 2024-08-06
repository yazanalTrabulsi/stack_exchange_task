import 'dart:convert';

import 'package:stack_exchange_task/features/questions/data/models/question_model.dart';
import '../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class QuestionRemoteDataSource {
  Future<List<QuestionModel>> getAllQuestions(page, pageSize);
}

const BASE_URL = "https://api.stackexchange.com";

class QuestionRemoteDataSourceImpl implements QuestionRemoteDataSource {
  final http.Client client;

  QuestionRemoteDataSourceImpl({required this.client});

  @override
  Future<List<QuestionModel>> getAllQuestions(page, pageSize) async {
    final response = await client.get(
      Uri.parse(
          BASE_URL + "/2.3/questions?page=$page&pagesize=$pageSize&order=desc&sort=activity&site=stackoverflow"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> decodedJson = json.decode(response.body) as Map<String, dynamic>;
      if (decodedJson.containsKey('items') &&
          decodedJson['items'] is List<dynamic>) {
        final List<dynamic> items = decodedJson['items'] as List<dynamic>;

        final List<QuestionModel> questionModels = items
            .map<QuestionModel>(
                (jsonQuestionModel) => QuestionModel.fromMap(jsonQuestionModel as Map<String, dynamic>))
            .toList();

        return questionModels;
      } else {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }
}
