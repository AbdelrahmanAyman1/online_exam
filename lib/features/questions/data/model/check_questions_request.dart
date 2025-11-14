import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/questions/data/model/answer_check_dto.dart';

part 'check_questions_request.g.dart';

@JsonSerializable()
class CheckQuestionsRequest {
  @JsonKey(name: "answers")
  final List<AnswersCheckDto>? answers;
  @JsonKey(name: "time")
  final int? time;

  CheckQuestionsRequest({this.answers, this.time});

  factory CheckQuestionsRequest.fromJson(Map<String, dynamic> json) {
    return _$CheckQuestionsRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CheckQuestionsRequestToJson(this);
  }
}
