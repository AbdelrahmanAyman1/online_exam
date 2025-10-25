import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_request.g.dart';

@JsonSerializable()
class VerifyResetCodeRequest {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  VerifyResetCodeRequest ({
    this.resetCode,
  });

  factory VerifyResetCodeRequest.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyResetCodeRequestToJson(this);
  }
}


