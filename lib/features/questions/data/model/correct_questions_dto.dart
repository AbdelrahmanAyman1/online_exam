import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/questions/data/model/answer_dto.dart';

part 'correct_questions_dto.g.dart';

@JsonSerializable()
class CorrectQuestionsDto {
  @JsonKey(name: "QID")
  final String? qID;
  @JsonKey(name: "Question")
  final String? question;
  @JsonKey(name: "correctAnswer")
  final String? correctAnswer;
  @JsonKey(name: "answers")
  final AnswersDto? answers;

  CorrectQuestionsDto({
    this.qID,
    this.question,
    this.correctAnswer,
    this.answers,
  });

  factory CorrectQuestionsDto.fromJson(Map<String, dynamic> json) {
    return _$CorrectQuestionsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CorrectQuestionsDtoToJson(this);
  }
}
