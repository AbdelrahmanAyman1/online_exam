import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/questions/data/model/answer_dto.dart';

part 'wrong_questions_dto.g.dart';

@JsonSerializable()
class WrongQuestionsDto {
  @JsonKey(name: "QID")
  final String? qID;
  @JsonKey(name: "Question")
  final String? question;
  @JsonKey(name: "inCorrectAnswer")
  final String? inCorrectAnswer;
  @JsonKey(name: "correctAnswer")
  final String? correctAnswer;
  @JsonKey(name: "answers")
  final AnswersDto? answers;

  WrongQuestionsDto({
    this.qID,
    this.question,
    this.inCorrectAnswer,
    this.correctAnswer,
    this.answers,
  });

  factory WrongQuestionsDto.fromJson(Map<String, dynamic> json) {
    return _$WrongQuestionsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WrongQuestionsDtoToJson(this);
  }
}
