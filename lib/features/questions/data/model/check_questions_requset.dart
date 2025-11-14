import 'package:json_annotation/json_annotation.dart';

part 'check_questions_requset.g.dart';

@JsonSerializable()
class CheckQuestionsRequset {
  @JsonKey(name: "answers")
  final List<Answers>? answers;
  @JsonKey(name: "time")
  final int? time;

  CheckQuestionsRequset ({
    this.answers,
    this.time,
  });

  factory CheckQuestionsRequset.fromJson(Map<String, dynamic> json) {
    return _$CheckQuestionsRequsetFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CheckQuestionsRequsetToJson(this);
  }
}

@JsonSerializable()
class Answers {
  @JsonKey(name: "questionId")
  final String? questionId;
  @JsonKey(name: "correct")
  final String? correct;

  Answers ({
    this.questionId,
    this.correct,
  });

  factory Answers.fromJson(Map<String, dynamic> json) {
    return _$AnswersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersToJson(this);
  }
}


