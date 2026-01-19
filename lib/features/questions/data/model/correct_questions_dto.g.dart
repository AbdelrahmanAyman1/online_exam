// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'correct_questions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CorrectQuestionsDto _$CorrectQuestionsDtoFromJson(Map<String, dynamic> json) =>
    CorrectQuestionsDto(
      qID: json['QID'] as String?,
      question: json['Question'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: json['answers'] == null
          ? null
          : AnswersDto.fromJson(json['answers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CorrectQuestionsDtoToJson(
  CorrectQuestionsDto instance,
) => <String, dynamic>{
  'QID': instance.qID,
  'Question': instance.question,
  'correctAnswer': instance.correctAnswer,
  'answers': instance.answers,
};
