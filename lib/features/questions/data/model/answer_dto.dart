import 'package:json_annotation/json_annotation.dart';

part 'answer_dto.g.dart';

@JsonSerializable()
class AnswersDto {
  @JsonKey(name: "answer")
  final String? answer;
  @JsonKey(name: "key")
  final String? key;

  AnswersDto({this.answer, this.key});

  factory AnswersDto.fromJson(Map<String, dynamic> json) {
    return _$AnswersDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersDtoToJson(this);
  }
}
