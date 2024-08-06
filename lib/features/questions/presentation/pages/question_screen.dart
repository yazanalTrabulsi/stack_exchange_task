import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stack_exchange_task/core/widgets/loading_widget.dart';
import 'package:stack_exchange_task/features/questions/domain/entities/question_entity.dart';
import 'package:stack_exchange_task/features/questions/presentation/controllers/question_controller.dart';
import 'package:stack_exchange_task/features/questions/presentation/widgets/list_item_question.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class QuestionsScreen extends GetWidget<QuestionController> {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() => AppBar(title: const Text('Questions'));

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(
        top: false,
        child: PagedListView<int, QuestionEntity>(
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<QuestionEntity>(
            itemBuilder: (context, item, index) => listItemQuestion(context, item, index),
            firstPageProgressIndicatorBuilder: (context) => const LoadingWidget(),
            newPageProgressIndicatorBuilder: (context) => const LoadingWidget(),
            firstPageErrorIndicatorBuilder: (context) => Center(child: Text('Error: ${controller.pagingController.error}')),
            noItemsFoundIndicatorBuilder: (context) => const Center(child: Text('No questions found.')),
          ),
        ),
      ),
    );
  }
}
