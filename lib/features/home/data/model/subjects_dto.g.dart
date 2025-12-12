// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsDto _$SubjectsDtoFromJson(Map<String, dynamic> json) => SubjectsDto(
  message: json['message'] as String?,
  metadata: json['metadata'] == null
      ? null
      : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
  subjects: (json['subjects'] as List<dynamic>?)
      ?.map((e) => Subjects.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SubjectsDtoToJson(SubjectsDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'subjects': instance.subjects,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
  'currentPage': instance.currentPage,
  'numberOfPages': instance.numberOfPages,
  'limit': instance.limit,
};

Subjects _$SubjectsFromJson(Map<String, dynamic> json) => Subjects(
  Id: json['_id'] as String?,
  name: json['name'] as String?,
  icon: json['icon'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$SubjectsToJson(Subjects instance) => <String, dynamic>{
  '_id': instance.Id,
  'name': instance.name,
  'icon': instance.icon,
  'createdAt': instance.createdAt,
};
