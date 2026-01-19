// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsDto _$QuestionsDtoFromJson(Map<String, dynamic> json) => QuestionsDto(
  answers: (json['answers'] as List<dynamic>?)
      ?.map((e) => AnswersDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  type: json['type'] as String?,
  Id: json['_id'] as String?,
  question: json['question'] as String?,
  correct: json['correct'] as String?,
  subject: json['subject'],
  exam: json['exam'] == null
      ? null
      : ExamDto.fromJson(json['exam'] as Map<String, dynamic>),
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$QuestionsDtoToJson(QuestionsDto instance) =>
    <String, dynamic>{
      'answers': instance.answers,
      'type': instance.type,
      '_id': instance.Id,
      'question': instance.question,
      'correct': instance.correct,
      'subject': instance.subject,
      'exam': instance.exam,
      'createdAt': instance.createdAt,
    };
