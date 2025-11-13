import 'package:online_exam/features/home/data/model/exam_model_dto.dart';

class ExamsResponseEntity {
  String? message;
  PaginationEntity? pagination;
  List<ExamsEntity>? exams;

  ExamsResponseEntity({this.message, this.pagination, this.exams});
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
}
