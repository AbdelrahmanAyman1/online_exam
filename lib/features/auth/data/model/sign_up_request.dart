import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  @JsonKey(name: "username")
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? rePassword;
  String? phone;
  SignUpRequestModel({
    this.email,
    this.password,
    this.rePassword,
    this.userName,
    this.firstName,
    this.lastName,
    this.phone,
  });

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);
}
