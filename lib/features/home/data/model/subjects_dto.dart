import 'package:json_annotation/json_annotation.dart';

part 'subjects_dto.g.dart';

@JsonSerializable()
class SubjectsDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "subjects")
  final List<Subjects>? subjects;

  SubjectsDto ({
    this.message,
    this.metadata,
    this.subjects,
  });

  factory SubjectsDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectsDtoToJson(this);
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;

  Metadata ({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}

@JsonSerializable()
class Subjects {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Subjects ({
    this.Id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory Subjects.fromJson(Map<String, dynamic> json) {
    return _$SubjectsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectsToJson(this);
  }
}


