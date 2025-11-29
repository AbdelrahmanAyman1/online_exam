import 'package:json_annotation/json_annotation.dart';
part 'update_request_dto.g.dart';
@JsonSerializable()
class UpdateUserModel {
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
}
