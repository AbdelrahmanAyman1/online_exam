// features/questions/domain/entities/question_entity.dart
class QuestionModel {
  final String id;
  final String text;
  final List<String> options;
  final List<String> keys; // A1, A2, A3, A4
  final String correctKey;
  String? userAnswerKey;

  QuestionModel({
    required this.id,
    required this.text,
    required this.options,
    required this.keys,
    required this.correctKey,
    this.userAnswerKey,
  });
}
