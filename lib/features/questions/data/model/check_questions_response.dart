import 'package:json_annotation/json_annotation.dart';

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
  final List<WrongQuestions>? WrongQuestions;
  @JsonKey(name: "correctQuestions")
  final List<CorrectQuestions>? correctQuestions;

  CheckQuestionsResponse ({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.WrongQuestions,
    this.correctQuestions,
  });

  factory CheckQuestionsResponse.fromJson(Map<String, dynamic> json) {
    return _$CheckQuestionsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CheckQuestionsResponseToJson(this);
  }
}

@JsonSerializable()
class WrongQuestions {
  @JsonKey(name: "QID")
  final String? QID;
  @JsonKey(name: "Question")
  final String? Question;
  @JsonKey(name: "inCorrectAnswer")
  final String? inCorrectAnswer;
  @JsonKey(name: "correctAnswer")
  final String? correctAnswer;
  @JsonKey(name: "answers")
  final Answers? answers;

  WrongQuestions ({
    this.QID,
    this.Question,
    this.inCorrectAnswer,
    this.correctAnswer,
    this.answers,
  });

  factory WrongQuestions.fromJson(Map<String, dynamic> json) {
    return _$WrongQuestionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WrongQuestionsToJson(this);
  }
}

@JsonSerializable()
class Answers {

  Answers ({
  });

  factory Answers.fromJson(Map<String, dynamic> json) {
    return _$AnswersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersToJson(this);
  }
}

@JsonSerializable()
class CorrectQuestions {
  @JsonKey(name: "QID")
  final String? QID;
  @JsonKey(name: "Question")
  final String? Question;
  @JsonKey(name: "correctAnswer")
  final String? correctAnswer;
  @JsonKey(name: "answers")
  final Answers? answers;

  CorrectQuestions ({
    this.QID,
    this.Question,
    this.correctAnswer,
    this.answers,
  });

  factory CorrectQuestions.fromJson(Map<String, dynamic> json) {
    return _$CorrectQuestionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CorrectQuestionsToJson(this);
  }
}

@JsonSerializable()
class Answers {

  Answers ({
  });

  factory Answers.fromJson(Map<String, dynamic> json) {
    return _$AnswersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersToJson(this);
  }
}


