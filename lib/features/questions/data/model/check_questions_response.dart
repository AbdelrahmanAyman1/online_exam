import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/questions/data/model/correct_questions_dto.dart';
import 'package:online_exam/features/questions/data/model/wrong_questions_dto.dart';

part 'check_questions_response.g.dart';

@JsonSerializable()
class CheckQuestionsResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "correct")
  final int? correct;
  @JsonKey(name: "wrong")
  final int? wrong;
  @JsonKey(name: "total")
  final String? total;
  @JsonKey(name: "WrongQuestions")
  final List<WrongQuestionsDto>? wrongQuestions;
  @JsonKey(name: "correctQuestions")
  final List<CorrectQuestionsDto>? correctQuestions;

  CheckQuestionsResponse({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.wrongQuestions,
    this.correctQuestions,
  });

  factory CheckQuestionsResponse.fromJson(Map<String, dynamic> json) {
    return _$CheckQuestionsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CheckQuestionsResponseToJson(this);
  }
}
