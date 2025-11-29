// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserModel _$UpdateUserModelFromJson(Map<String, dynamic> json) =>
    UpdateUserModel(
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phone'] as String?,
      userName: json['username'] as String?,
    );

Map<String, dynamic> _$UpdateUserModelToJson(UpdateUserModel instance) =>
    <String, dynamic>{
      'username': instance.userName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phoneNumber,
    };
