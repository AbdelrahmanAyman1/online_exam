import 'package:json_annotation/json_annotation.dart';
part 'user_info_dto.g.dart';

@JsonSerializable()
class UserInfoDto {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'user')
  UserModel? user;

  UserInfoDto({this.message, this.user});

  factory UserInfoDto.fromJson(Map<String, dynamic> json) {
    return _$UserInfoDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserInfoDtoToJson(this);
  }
}

@JsonSerializable()
class UserModel {
  @JsonKey(name: "_id")
  String? id;
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
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "isVerified")
  bool? isVerified;
  @JsonKey(name: "createdAt")
  String? createdAt;

  UserModel({
    this.createdAt,
    this.email,
    this.firstName,
    this.id,
    this.isVerified,
    this.lastName,
    this.phoneNumber,
    this.role,
    this.userName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
