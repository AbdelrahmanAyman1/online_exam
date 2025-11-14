import 'package:online_exam/features/home/data/model/exam_model_dto.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';

extension ExamResponseMapper on ExamsResponseModelDto {
  ExamsResponseEntity toEntity() => ExamsResponseEntity(
    message: message,
    pagination: pagination?.toEntity(),
    exams: exams?.map((exam) => exam.toEntity()).toList(),
  );
}

extension ExamPagination on Pagination {
  PaginationEntity toEntity() => PaginationEntity(
    currentPage: currentPage,
    limit: limit,
    numberOfPages: limit,
  );
}

extension Exam on ExamsModel {
  ExamsEntity toEntity() => ExamsEntity(
    active: active,
    createdAt: createdAt,
    duration: duration,
    id: id,
    numberOfQuestions: numberOfQuestions,
    subject: subject,
    title: title,
  );
}
