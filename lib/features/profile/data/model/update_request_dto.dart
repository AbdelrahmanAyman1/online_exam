import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'update_request_dto.g.dart';

@JsonSerializable()
class UpdateUserModel extends Equatable {
  @JsonKey(name: "username")
  String? userName;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phoneNumber;

  UpdateUserModel({
    this.email,
    this.firstName,

    this.lastName,
    this.phoneNumber,

    this.userName,
  });

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateUserModelToJson(this);
  }

  @override
  List<Object?> get props => [
    email,
    firstName,
    lastName,
    phoneNumber,
    userName,
  ];
}
