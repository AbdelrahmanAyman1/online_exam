import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/subject_entity.dart';

part 'subject_model.g.dart';
@JsonSerializable()
class SubjectModel extends SubjectEntity {
  @override
  final int id;
  @override
  final String name;

  SubjectModel({
    required this.id,
    required this.name,
  }) : super(id: id, name: name);

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);
}

