import 'package:json_annotation/json_annotation.dart';

part 'questions_rsponse.g.dart';

@JsonSerializable()
class QuestionsResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "questions")
  final List<Questions>? questions;

  QuestionsResponse ({
    this.message,
    this.questions,
  });

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) {
    return _$QuestionsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionsResponseToJson(this);
  }
}

@JsonSerializable()
class Questions {
  @JsonKey(name: "answers")
  final List<Answers>? answers;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "correct")
  final String? correct;
  @JsonKey(name: "subject")
  final dynamic? subject;
  @JsonKey(name: "exam")
  final Exam? exam;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Questions ({
    this.answers,
    this.type,
    this.Id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    return _$QuestionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionsToJson(this);
  }
}

@JsonSerializable()
class Answers {
  @JsonKey(name: "answer")
  final String? answer;
  @JsonKey(name: "key")
  final String? key;

  Answers ({
    this.answer,
    this.key,
  });

  factory Answers.fromJson(Map<String, dynamic> json) {
    return _$AnswersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersToJson(this);
  }
}

@JsonSerializable()
class Exam {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Exam ({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return _$ExamFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamToJson(this);
  }
}


