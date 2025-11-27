import 'package:json_annotation/json_annotation.dart';
part 'answers_dto.g.dart';

@JsonSerializable()
class AnswersDto {
  AnswersDto();

  factory AnswersDto.fromJson(Map<String, dynamic> json) {
    return _$AnswersDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersDtoToJson(this);
  }
}
