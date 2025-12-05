// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrong_questions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WrongQuestionsDto _$WrongQuestionsDtoFromJson(Map<String, dynamic> json) =>
    WrongQuestionsDto(
      qID: json['QID'] as String?,
      question: json['Question'] as String?,
      inCorrectAnswer: json['inCorrectAnswer'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: json['answers'] == null
          ? null
          : AnswersDto.fromJson(json['answers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WrongQuestionsDtoToJson(WrongQuestionsDto instance) =>
    <String, dynamic>{
      'QID': instance.qID,
      'Question': instance.question,
      'inCorrectAnswer': instance.inCorrectAnswer,
      'correctAnswer': instance.correctAnswer,
      'answers': instance.answers,
    };
