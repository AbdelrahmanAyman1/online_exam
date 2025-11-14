import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_model_dto.g.dart';

@JsonSerializable()
class ExamsResponseModelDto {
  
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "metadata")
  Pagination? pagination;
  @JsonKey(name: "exams")
  List<ExamsModel>? exams;

  ExamsResponseModelDto({this.message, this.pagination, this.exams});

  factory ExamsResponseModelDto.fromJson(Map<String, dynamic> json) =>
      _$ExamsResponseModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamsResponseModelDtoToJson(this);


  @override
  bool operator ==(covariant ExamsResponseModelDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      other.pagination == pagination &&
      listEquals(other.exams, exams);
  }

  @override
  int get hashCode => message.hashCode ^ pagination.hashCode ^ exams.hashCode;
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: "currentPage")
  int? currentPage;
  @JsonKey(name: "numberOfPages")
  int? numberOfPages;
  @JsonKey(name: "limit")
  int? limit;

  Pagination({this.currentPage, this.numberOfPages, this.limit});
  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class ExamsModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "duration")
  int? duration;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "numberOfQuestions")
  int? numberOfQuestions;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  ExamsModel({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });
  factory ExamsModel.fromJson(Map<String, dynamic> json) =>
      _$ExamsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExamsModelToJson(this);
}
