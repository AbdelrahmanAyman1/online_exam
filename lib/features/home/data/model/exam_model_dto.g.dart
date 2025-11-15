// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamsResponseModelDto _$ExamsResponseModelDtoFromJson(
  Map<String, dynamic> json,
) => ExamsResponseModelDto(
  message: json['message'] as String?,
  pagination: json['metadata'] == null
      ? null
      : Pagination.fromJson(json['metadata'] as Map<String, dynamic>),
  exams: (json['exams'] as List<dynamic>?)
      ?.map((e) => ExamsModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ExamsResponseModelDtoToJson(
  ExamsResponseModelDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'metadata': instance.pagination,
  'exams': instance.exams,
};

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };

ExamsModel _$ExamsModelFromJson(Map<String, dynamic> json) => ExamsModel(
  id: json['_id'] as String?,
  title: json['title'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  subject: json['subject'] as String?,
  numberOfQuestions: (json['numberOfQuestions'] as num?)?.toInt(),
  active: json['active'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ExamsModelToJson(ExamsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'subject': instance.subject,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.active,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
