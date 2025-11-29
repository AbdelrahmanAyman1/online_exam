// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequest _$ChangePasswordRequestFromJson(
  Map<String, dynamic> json,
) => ChangePasswordRequest(
  oldPassword: json['oldPassword'] as String?,
  password: json['password'] as String?,
  rePassword: json['rePassword'] as String?,
);

Map<String, dynamic> _$ChangePasswordRequestToJson(
  ChangePasswordRequest instance,
) => <String, dynamic>{
  'oldPassword': instance.oldPassword,
  'password': instance.password,
  'rePassword': instance.rePassword,
};
