// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_questions_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckQuestionsRequest _$CheckQuestionsRequestFromJson(
  Map<String, dynamic> json,
) => CheckQuestionsRequest(
  answers: (json['answers'] as List<dynamic>?)
      ?.map((e) => AnswersCheckDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  time: (json['time'] as num?)?.toInt(),
);

Map<String, dynamic> _$CheckQuestionsRequestToJson(
  CheckQuestionsRequest instance,
) => <String, dynamic>{'answers': instance.answers, 'time': instance.time};
