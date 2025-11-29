import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  @JsonKey(name: "oldPassword")
  final String? oldPassword;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;

  ChangePasswordRequest({this.oldPassword, this.password, this.rePassword});

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ChangePasswordRequestToJson(this);
  }
}
