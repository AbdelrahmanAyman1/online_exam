// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseDto _$SignUpResponseDtoFromJson(Map<String, dynamic> json) =>
    SignUpResponseDto(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpResponseDtoToJson(SignUpResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
