// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_check_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswersCheckDto _$AnswersCheckDtoFromJson(Map<String, dynamic> json) =>
    AnswersCheckDto(
      questionId: json['questionId'] as String?,
      correct: json['correct'] as String?,
    );

Map<String, dynamic> _$AnswersCheckDtoToJson(AnswersCheckDto instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'correct': instance.correct,
    };
