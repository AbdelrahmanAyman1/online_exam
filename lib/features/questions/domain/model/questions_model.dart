// features/questions/domain/entities/question_entity.dart
class QuestionModel {
  final String? id;
  final String? question;
  final List<String>? answers;
  final List<String>? keys;
  final String? correctKey;
  String? userAnswerKey;

  QuestionModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.keys,
    required this.correctKey,
    this.userAnswerKey,
  });
}
