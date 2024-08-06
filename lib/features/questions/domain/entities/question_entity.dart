import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final List<String> tags;
  final OwnerEntity owner;
  final bool isAnswered;
  final int viewCount;
  final int answerCount;
  final int score;
  final int lastActivityDate;
  final int creationDate;
  final int? lastEditDate;
  final int questionId;
  final String contentLicense;
  final String link;
  final String title;

  const QuestionEntity({
    required this.tags,
    required this.owner,
    required this.isAnswered,
    required this.viewCount,
    required this.answerCount,
    required this.score,
    required this.lastActivityDate,
    required this.creationDate,
    this.lastEditDate,
    required this.questionId,
    required this.contentLicense,
    required this.link,
    required this.title,
  });

  @override
  List<Object?> get props => [
        tags,
        owner,
        isAnswered,
        viewCount,
        answerCount,
        score,
        lastActivityDate,
        questionId,
        contentLicense,
        link,
        title
      ];
}

class OwnerEntity {
  final int accountId;
  final int reputation;
  final int userId;
  final String userType;
  final int? acceptRate;
  final String profileImage;
  final String displayName;
  final String link;

  OwnerEntity({
    required this.accountId,
    required this.reputation,
    required this.userId,
    required this.userType,
    this.acceptRate,
    required this.profileImage,
    required this.displayName,
    required this.link,
  });
}
