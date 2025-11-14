import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/questions/data/model/answer_dto.dart';
import 'package:online_exam/features/questions/data/model/exam_dto.dart';

part 'questions_dto.g.dart';

@JsonSerializable()
class QuestionsDto {
  @JsonKey(name: "answers")
  final List<AnswersDto>? answers;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "correct")
  final String? correct;
  @JsonKey(name: "subject")
  final dynamic subject;
  @JsonKey(name: "exam")
  final ExamDto? exam;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  QuestionsDto({
    this.answers,
    this.type,
    this.Id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory QuestionsDto.fromJson(Map<String, dynamic> json) {
    return _$QuestionsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionsDtoToJson(this);
  }
}
