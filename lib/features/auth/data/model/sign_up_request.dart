import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  @JsonKey(name: "username")
  String? userName;
  String? firstName;
  String? lastName;
  final String email;
  final String password;
  final String rePassword;
  String? phone;
  SignUpRequestModel({
    required this.email,
    required this.password,
    required this.rePassword,
    this.userName,
    this.firstName,
    this.lastName,
    this.phone
  });

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);
}
