// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:online_exam/features/home/data/model/exam_model_dto.dart';

class ExamsResponseEntity {
  String? message;
  PaginationEntity? pagination;
  List<ExamsEntity>? exams;

  ExamsResponseEntity({this.message, this.pagination, this.exams});

  @override
  bool operator ==(covariant ExamsResponseEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      other.pagination == pagination &&
      listEquals(other.exams, exams);
  }

  @override
  int get hashCode => message.hashCode ^ pagination.hashCode ^ exams.hashCode;
}

class PaginationEntity {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  PaginationEntity({this.currentPage, this.numberOfPages, this.limit});
}

class ExamsEntity {
  String? id;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  DateTime? createdAt;

  ExamsEntity({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });
  ExamsModel toEntity() {
    return ExamsModel(
      id: id,
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      active: active,
      createdAt: createdAt,
    );
  }

  @override
  bool operator ==(covariant ExamsEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.duration == duration &&
      other.subject == subject &&
      other.numberOfQuestions == numberOfQuestions &&
      other.active == active &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      duration.hashCode ^
      subject.hashCode ^
      numberOfQuestions.hashCode ^
      active.hashCode ^
      createdAt.hashCode;
  }
}
