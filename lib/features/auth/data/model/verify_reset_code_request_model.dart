import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_request_model.g.dart';

@JsonSerializable()
class VerifyResetCodeRequestModel {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  VerifyResetCodeRequestModel({this.resetCode});

  factory VerifyResetCodeRequestModel.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyResetCodeRequestModelToJson(this);
  }
}
