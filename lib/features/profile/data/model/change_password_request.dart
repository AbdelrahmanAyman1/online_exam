import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest extends Equatable {
  @JsonKey(name: "oldPassword")
  final String? oldPassword;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;

  const ChangePasswordRequest({
    this.oldPassword,
    this.password,
    this.rePassword,
  });

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ChangePasswordRequestToJson(this);
  }

  @override
  List<Object?> get props => [oldPassword, password, rePassword];
}
