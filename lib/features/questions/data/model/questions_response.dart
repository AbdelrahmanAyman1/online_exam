import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/questions/data/model/questions_dto.dart';

part 'questions_response.g.dart';

@JsonSerializable()
class QuestionsResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "questions")
  final List<QuestionsDto>? questions;

  QuestionsResponse({this.message, this.questions});

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) {
    return _$QuestionsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionsResponseToJson(this);
  }
}
