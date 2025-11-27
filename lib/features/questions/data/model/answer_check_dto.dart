import 'package:json_annotation/json_annotation.dart';

part 'answer_check_dto.g.dart';

@JsonSerializable()
class AnswersCheckDto {
  @JsonKey(name: "questionId")
  final String? questionId;
  @JsonKey(name: "correct")
  final String? correct;

  AnswersCheckDto({this.questionId, this.correct});

  factory AnswersCheckDto.fromJson(Map<String, dynamic> json) {
    return _$AnswersCheckDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersCheckDtoToJson(this);
  }
}
