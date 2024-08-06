import 'dart:convert';

import 'package:stack_exchange_task/features/questions/domain/entities/question_entity.dart';

class StackOverflowResponseModel {
  final List<QuestionModel> items;

  StackOverflowResponseModel({
    required this.items,
  });

  factory StackOverflowResponseModel.fromJson(String str) =>
      StackOverflowResponseModel.fromMap(json.decode(str));

  factory StackOverflowResponseModel.fromMap(Map<String, dynamic> json) =>
      StackOverflowResponseModel(
        items: List<QuestionModel>.from(json["items"]
            .map((x) => QuestionModel.fromMap(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class QuestionModel extends QuestionEntity {
  const QuestionModel({
    required List<String> tags,
    required OwnerModel owner,
    required bool isAnswered,
    required int viewCount,
    required int answerCount,
    required int score,
    required int lastActivityDate,
    required int creationDate,
    int? lastEditDate,
    required int questionId,
    required String contentLicense,
    required String link,
    required String title,
  }) : super(
          tags: tags,
          owner: owner,
          isAnswered: isAnswered,
          viewCount: viewCount,
          answerCount: answerCount,
          score: score,
          lastActivityDate: lastActivityDate,
          creationDate: creationDate,
          lastEditDate: lastEditDate,
          questionId: questionId,
          contentLicense: contentLicense,
          link: link,
          title: title,
        );

  factory QuestionModel.fromMap(Map<String, dynamic> json) => QuestionModel(
        tags: List<String>.from(json["tags"].map((x) => x)),
        owner: OwnerModel.fromMap(json["owner"]),
        isAnswered: json["is_answered"],
        viewCount: json["view_count"],
        answerCount: json["answer_count"],
        score: json["score"],
        lastActivityDate: json["last_activity_date"],
        creationDate: json["creation_date"],
        lastEditDate:
            json["last_edit_date"] == null ? null : json["last_edit_date"],
        questionId: json["question_id"],
        contentLicense:
            json["content_license"] == null ? '' : json["content_license"],
        link: json["link"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "owner": (owner as OwnerModel).toMap(),
        "is_answered": isAnswered,
        "view_count": viewCount,
        "answer_count": answerCount,
        "score": score,
        "last_activity_date": lastActivityDate,
        "creation_date": creationDate,
        "last_edit_date": lastEditDate,
        "question_id": questionId,
        "content_license": contentLicense,
        "link": link,
        "title": title,
      };

  Map<String, dynamic> toJson() {
    return {
      'tags': List<dynamic>.from(tags),
      'owner': (owner as OwnerModel).toMap(),
      'is_answered': isAnswered,
      'view_count': viewCount,
      'answer_count': answerCount,
      'score': score,
      'last_activity_date': lastActivityDate,
      'creation_date': creationDate,
      'last_edit_date': lastEditDate,
      'question_id': questionId,
      'content_license': contentLicense,
      'link': link,
      'title': title,
    };
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      tags: List<String>.from(json['tags']),
      owner: OwnerModel.fromMap(json['owner']),
      isAnswered: json['is_answered'],
      viewCount: json['view_count'],
      answerCount: json['answer_count'],
      score: json['score'],
      lastActivityDate: json['last_activity_date'],
      creationDate: json['creation_date'],
      lastEditDate: json['last_edit_date'],
      questionId: json['question_id'],
      contentLicense: json['content_license'] ?? '',
      link: json['link'],
      title: json['title'],
    );
  }
}

class OwnerModel extends OwnerEntity {
  OwnerModel({
    required int accountId,
    required int reputation,
    required int userId,
    required String userType,
    int? acceptRate,
    required String profileImage,
    required String displayName,
    required String link,
  }) : super(
          accountId: accountId,
          reputation: reputation,
          userId: userId,
          userType: userType,
          acceptRate: acceptRate,
          profileImage: profileImage,
          displayName: displayName,
          link: link,
        );

  factory OwnerModel.fromJson(String str) =>
      OwnerModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OwnerModel.fromMap(Map<String, dynamic> json) => OwnerModel(
        accountId: json["account_id"] == null ? 0 : json["account_id"],
        reputation: json["reputation"] == null ? 0 : json["reputation"],
        userId: json["user_id"] == null ? 0 : json["user_id"],
        userType: json["user_type"],
        acceptRate: json["accept_rate"] == null ? 0 : json["accept_rate"],
        profileImage:
            json["profile_image"] == null ? '' : json["profile_image"],
        displayName: json["display_name"] == null ? '' : json["display_name"],
        link: json["link"] == null ? '' : json["link"],
      );

  Map<String, dynamic> toMap() => {
        "account_id": accountId,
        "reputation": reputation,
        "user_id": userId,
        "user_type": userType,
        "accept_rate": acceptRate,
        "profile_image": profileImage,
        "display_name": displayName,
        "link": link,
      };
}
