import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/auth/data/model/user_dto.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
part 'sign_up_response_dto.g.dart';

@JsonSerializable()
class SignUpResponseDto {
  String? message;
  String? token;
  User? user;

  SignUpResponseDto({this.message, this.token, this.user});

  factory SignUpResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseDtoToJson(this);

  SignUpResponseModel toModel() {
    return SignUpResponseModel(
      message: message,
      token: token,
      user: user?.userModel(),
    );
  }
}
